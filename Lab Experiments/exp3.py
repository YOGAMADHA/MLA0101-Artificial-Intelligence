from queue import PriorityQueue

graph = {
    'A': [('B', 1), ('C', 4)],
    'B': [('D', 2)],
    'C': [('D', 1)],
    'D': []
}

pq = PriorityQueue()
pq.put((0, 'A'))
visited = []

while not pq.empty():
    cost, node = pq.get()
    if node not in visited:
        print(node, cost)
        visited.append(node)
        for n, c in graph[node]:
            pq.put((cost + c, n))