import tensorflow as tf
import numpy as np

# Load trained model
model = tf.keras.models.load_model("image_classifier.keras")

# Class names
class_names = ["animal", "building", "vehicle"]

# Image to predict
image_path = input("Enter image path: ")

# Load image
image = tf.keras.utils.load_img(
    image_path,
    target_size=(128, 128)
)

# Convert image to array
image_array = tf.keras.utils.img_to_array(image)

# Add batch dimension
image_array = np.expand_dims(image_array, axis=0)

# Predict
prediction = model.predict(image_array)

# Get predicted class
index = np.argmax(prediction[0])

# Get confidence
confidence = prediction[0][index] * 100

print("\n-----------------------------")
print("IMAGE RECOGNITION RESULT")
print("-----------------------------")
print("Predicted Class :", class_names[index])
print("Confidence      :", round(confidence, 2), "%")
print("-----------------------------")