graph = {
    'A': ['B', 'C'],
    'B': ['D'],
    'C': ['E'],
    'D': [],
    'E': []
}

h = {'A':5,'B':3,'C':4,'D':1,'E':0}

visited = []
queue = ['A']

while queue:
    queue.sort(key=lambda x:h[x])
    node = queue.pop(0)
    print(node, end=" ")
    visited.append(node)
    for i in graph[node]:
        if i not in visited:
            queue.append(i)