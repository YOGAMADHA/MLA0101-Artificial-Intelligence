graph = {
    'A':['B','C'],
    'B':['D'],
    'C':['E'],
    'D':[],
    'E':[]
}

h = {'A':4,'B':2,'C':3,'D':1,'E':0}

node = 'A'

while True:
    print(node, end=" ")

    if node == 'E' or graph[node] == []:
        break

    node = min(graph[node], key=lambda x: h[x])