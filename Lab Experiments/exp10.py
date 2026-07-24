def hanoi(n, s, a, d):
    if n == 1:
        print(s, "->", d)
        return
    hanoi(n-1, s, d, a)
    print(s, "->", d)
    hanoi(n-1, a, s, d)

hanoi(3, 'A', 'B', 'C')