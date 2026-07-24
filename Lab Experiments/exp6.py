graph = {
    'A':[('B',1),('C',3)],
    'B':[('D',2)],
    'C':[('D',1)],
    'D':[]
}

h = {'A':3,'B':2,'C':1,'D':0}

open = [(0,'A')]

while open:
    open.sort()
    cost,node = open.pop(0)
    print(node,end=" ")
    if node=='D':
        break
    for n,c in graph[node]:
        open.append((cost+c+h[n],n))