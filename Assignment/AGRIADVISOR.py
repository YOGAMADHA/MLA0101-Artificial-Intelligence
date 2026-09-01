# ============================================================
# AGRIADVISOR
# A Multi-Agent, Rule-Based Expert System for Crop Disease
# Diagnosis and Farm Resource Advisory
# ============================================================

# ------------------------------------------------------------
# 1. KNOWLEDGE BASE
# ------------------------------------------------------------

knowledge_base = [

    # ---------- IRRIGATION RULES ----------
    {
        "name": "R1",
        "conditions": ["soil_low"],
        "conclusion": "Irrigation is required."
    },

    {
        "name": "R2",
        "conditions": ["soil_low", "temperature_high"],
        "conclusion": "Immediate irrigation is recommended."
    },

    {
        "name": "R3",
        "conditions": ["soil_adequate"],
        "conclusion": "Irrigation is not required."
    },

    {
        "name": "R4",
        "conditions": ["soil_medium", "temperature_high"],
        "conclusion": "Monitor soil moisture and consider irrigation."
    },

    # ---------- PEST RULES ----------
    {
        "name": "R5",
        "conditions": ["temperature_high", "humidity_high"],
        "conclusion": "High pest risk detected."
    },

    {
        "name": "R6",
        "conditions": ["holes_on_leaves", "insects_observed"],
        "conclusion": "Possible insect pest detected."
    },

    {
        "name": "R7",
        "conditions": ["curled_leaves", "insects_observed"],
        "conclusion": "Possible aphid infestation detected."
    },

    {
        "name": "R8",
        "conditions": ["high_pest_risk"],
        "conclusion": "Generate pest alert and inspect the crop."
    },

    # ---------- DISEASE RULES ----------
    {
        "name": "R9",
        "conditions": ["tomato", "yellow_spots"],
        "conclusion": "Possible tomato leaf disease detected."
    },

    {
        "name": "R10",
        "conditions": ["tomato", "dark_spots"],
        "conclusion": "Possible Early Blight detected."
    },

    {
        "name": "R11",
        "conditions": ["rice", "brown_spots"],
        "conclusion": "Possible Rice Blast or leaf disease detected."
    },

    {
        "name": "R12",
        "conditions": ["wheat", "yellow_orange_spots"],
        "conclusion": "Possible Wheat Rust detected."
    },

    {
        "name": "R13",
        "conditions": ["potato", "dark_lesions"],
        "conclusion": "Possible Late Blight detected."
    },

    # ---------- TREATMENT RULES ----------
    {
        "name": "R14",
        "conditions": ["fungal_disease"],
        "conclusion": "Remove affected leaves and follow suitable disease-control measures."
    },

    {
        "name": "R15",
        "conditions": ["insect_pest"],
        "conclusion": "Inspect the crop and follow suitable pest-control measures."
    },

    {
        "name": "R16",
        "conditions": ["disease_detected"],
        "conclusion": "Immediate crop inspection is recommended."
    }
]


# ------------------------------------------------------------
# 2. INFERENCE ENGINE - FORWARD CHAINING
# ------------------------------------------------------------

def forward_chaining(initial_facts):

    facts = set(initial_facts)
    fired_rules = []
    conclusions = []

    changed = True

    while changed:

        changed = False

        for rule in knowledge_base:

            # Check whether all conditions are satisfied
            if all(condition in facts for condition in rule["conditions"]):

                if rule["name"] not in fired_rules:

                    fired_rules.append(rule["name"])
                    conclusions.append(rule["conclusion"])

                    # Convert important conclusions into new facts
                    conclusion = rule["conclusion"].lower()

                    if "high pest risk" in conclusion:
                        facts.add("high_pest_risk")

                    if "insect pest" in conclusion:
                        facts.add("insect_pest")

                    if "early blight" in conclusion:
                        facts.add("fungal_disease")
                        facts.add("disease_detected")

                    if "tomato leaf disease" in conclusion:
                        facts.add("fungal_disease")
                        facts.add("disease_detected")

                    if "rice blast" in conclusion:
                        facts.add("fungal_disease")
                        facts.add("disease_detected")

                    if "wheat rust" in conclusion:
                        facts.add("fungal_disease")
                        facts.add("disease_detected")

                    if "late blight" in conclusion:
                        facts.add("fungal_disease")
                        facts.add("disease_detected")

                    changed = True

    return conclusions, fired_rules


# ------------------------------------------------------------
# 3. IRRIGATION AGENT
# ------------------------------------------------------------

class IrrigationAgent:

    def __init__(self):
        self.name = "Irrigation Scheduling Agent"
        self.internal_state = {}

    def perceive(self, soil_moisture, temperature):
        self.internal_state["soil_moisture"] = soil_moisture
        self.internal_state["temperature"] = temperature

        facts = []

        if soil_moisture.lower() == "low":
            facts.append("soil_low")

        elif soil_moisture.lower() == "medium":
            facts.append("soil_medium")

        elif soil_moisture.lower() == "adequate":
            facts.append("soil_adequate")

        if temperature.lower() == "high":
            facts.append("temperature_high")

        return facts

    def act(self, facts):
        results, rules = forward_chaining(facts)

        irrigation_results = []

        for result in results:
            if "irrigation" in result.lower():
                irrigation_results.append(result)

        return irrigation_results, rules


# ------------------------------------------------------------
# 4. PEST ALERT AGENT
# ------------------------------------------------------------

class PestAlertAgent:

    def __init__(self):
        self.name = "Pest Alert Agent"
        self.internal_state = {}

    def perceive(self, temperature, humidity, insects, holes, curled):

        self.internal_state["temperature"] = temperature
        self.internal_state["humidity"] = humidity

        facts = []

        if temperature.lower() == "high":
            facts.append("temperature_high")

        if humidity.lower() == "high":
            facts.append("humidity_high")

        if insects.lower() == "yes":
            facts.append("insects_observed")

        if holes.lower() == "yes":
            facts.append("holes_on_leaves")

        if curled.lower() == "yes":
            facts.append("curled_leaves")

        return facts

    def act(self, facts):

        results, rules = forward_chaining(facts)

        pest_results = []

        for result in results:
            if ("pest" in result.lower()
                    or "aphid" in result.lower()
                    or "insect" in result.lower()):

                pest_results.append(result)

        return pest_results, rules


# ------------------------------------------------------------
# 5. DISEASE DIAGNOSIS AGENT
# ------------------------------------------------------------

class DiseaseDiagnosisAgent:

    def __init__(self):
        self.name = "Disease Diagnosis Agent"
        self.internal_state = {}

    def perceive(self, crop, symptom):

        self.internal_state["crop"] = crop
        self.internal_state["symptom"] = symptom

        facts = []

        crop = crop.lower()
        symptom = symptom.lower()

        if crop == "tomato":
            facts.append("tomato")

        elif crop == "rice":
            facts.append("rice")

        elif crop == "wheat":
            facts.append("wheat")

        elif crop == "potato":
            facts.append("potato")

        if symptom == "yellow spots":
            facts.append("yellow_spots")

        elif symptom == "dark spots":
            facts.append("dark_spots")

        elif symptom == "brown spots":
            facts.append("brown_spots")

        elif symptom == "yellow-orange spots":
            facts.append("yellow_orange_spots")

        elif symptom == "dark lesions":
            facts.append("dark_lesions")

        return facts

    def act(self, facts):

        results, rules = forward_chaining(facts)

        disease_results = []

        for result in results:

            disease_words = [
                "disease",
                "blight",
                "rust",
                "blast"
            ]

            if any(word in result.lower() for word in disease_words):
                disease_results.append(result)

        return disease_results, rules


# ------------------------------------------------------------
# 6. AGRIADVISOR SYSTEM
# ------------------------------------------------------------

class AgriAdvisor:

    def __init__(self):

        self.irrigation_agent = IrrigationAgent()
        self.pest_agent = PestAlertAgent()
        self.disease_agent = DiseaseDiagnosisAgent()

    def run(self,
            crop,
            soil_moisture,
            temperature,
            humidity,
            symptom,
            insects="No",
            holes="No",
            curled="No"):

        print("\n" + "=" * 60)
        print("                 AGRIADVISOR")
        print("=" * 60)

        print("\nFARM INPUT")
        print("-" * 60)
        print("Crop              :", crop)
        print("Soil Moisture     :", soil_moisture)
        print("Temperature       :", temperature)
        print("Humidity          :", humidity)
        print("Leaf Symptom      :", symptom)
        print("Insects Observed  :", insects)
        print("Holes on Leaves   :", holes)
        print("Curled Leaves     :", curled)

        # ----------------------------------------------------
        # IRRIGATION AGENT
        # ----------------------------------------------------

        irrigation_facts = self.irrigation_agent.perceive(
            soil_moisture,
            temperature
        )

        irrigation_results, irrigation_rules = \
            self.irrigation_agent.act(irrigation_facts)

        print("\n" + "-" * 60)
        print("IRRIGATION SCHEDULING AGENT")
        print("-" * 60)

        if irrigation_results:
            for result in irrigation_results:
                print("→", result)
        else:
            print("→ No irrigation recommendation.")

        # ----------------------------------------------------
        # PEST AGENT
        # ----------------------------------------------------

        pest_facts = self.pest_agent.perceive(
            temperature,
            humidity,
            insects,
            holes,
            curled
        )

        pest_results, pest_rules = \
            self.pest_agent.act(pest_facts)

        print("\n" + "-" * 60)
        print("PEST ALERT AGENT")
        print("-" * 60)

        if pest_results:
            for result in pest_results:
                print("→", result)
        else:
            print("→ No major pest risk detected.")

        # ----------------------------------------------------
        # DISEASE AGENT
        # ----------------------------------------------------

        disease_facts = self.disease_agent.perceive(
            crop,
            symptom
        )

        disease_results, disease_rules = \
            self.disease_agent.act(disease_facts)

        print("\n" + "-" * 60)
        print("CROP DISEASE DIAGNOSIS AGENT")
        print("-" * 60)

        if disease_results:
            for result in disease_results:
                print("→", result)
        else:
            print("→ No matching disease detected.")

        # ----------------------------------------------------
        # FINAL RECOMMENDATION
        # ----------------------------------------------------

        print("\n" + "=" * 60)
        print("              FINAL RECOMMENDATION")
        print("=" * 60)

        recommendations = []

        recommendations.extend(irrigation_results)
        recommendations.extend(pest_results)
        recommendations.extend(disease_results)

        # Additional recommendations
        if any("Early Blight" in r for r in disease_results):
            recommendations.append(
                "Inspect affected tomato leaves and follow suitable fungal disease-control measures."
            )

        if any("Wheat Rust" in r for r in disease_results):
            recommendations.append(
                "Inspect wheat leaves and follow suitable disease-management measures."
            )

        if any("Late Blight" in r for r in disease_results):
            recommendations.append(
                "Inspect potato plants and follow suitable disease-management measures."
            )

        if any("Rice Blast" in r for r in disease_results):
            recommendations.append(
                "Inspect rice leaves and follow suitable disease-management measures."
            )

        if any("pest" in r.lower() for r in pest_results):
            recommendations.append(
                "Monitor the crop regularly and take appropriate pest-control action."
            )

        if recommendations:

            for i, recommendation in enumerate(
                    recommendations, 1):
                print(f"{i}. {recommendation}")

        else:
            print("Continue regular crop monitoring.")

        print("\n" + "=" * 60)

        return {
            "irrigation": irrigation_results,
            "pest": pest_results,
            "disease": disease_results
        }


# ------------------------------------------------------------
# 7. CREATE AGRIADVISOR SYSTEM
# ------------------------------------------------------------

system = AgriAdvisor()


# ------------------------------------------------------------
# 8. DEMONSTRATION
# ------------------------------------------------------------

result = system.run(
    crop="Tomato",
    soil_moisture="Low",
    temperature="High",
    humidity="High",
    symptom="Dark Spots",
    insects="No",
    holes="No",
    curled="No"
)