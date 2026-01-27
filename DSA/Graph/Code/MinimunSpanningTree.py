# Minimum Spanning Tree in Python

class DSU:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [0] * n
    
    def find_parent(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find_parent(self.parent[x])
        return self.parent[x]
    
    def union_sets(self, x, y):
        x = self.find_parent(x)
        y = self.find_parent(y)
        
        if x != y:
            if self.rank[x] < self.rank[y]:
                self.parent[x] = y
            elif self.rank[x] > self.rank[y]:
                self.parent[y] = x
            else:
                self.parent[y] = x
                self.rank[x] += 1

def kruskal_mst(vertices, edges):
    edges.sort(key=lambda x: x[2])
    
    dsu = DSU(vertices)
    print("Minimum Spanning Tree (Kruskal's):")
    mst_weight = 0
    mst_edges = 0
    
    for u, v, weight in edges:
        x = dsu.find_parent(u)
        y = dsu.find_parent(v)
        
        if x != y and mst_edges < vertices - 1:
            print(f"{u} - {v}: weight {weight}")
            mst_weight += weight
            mst_edges += 1
            dsu.union_sets(x, y)
    
    print(f"Total MST Weight: {mst_weight}")

# Test
print("=== Minimum Spanning Tree (Python) ===\n")

vertices = 5
edges = [
    (0, 1, 2),
    (0, 3, 6),
    (1, 2, 3),
    (1, 3, 8),
    (1, 4, 5),
    (2, 4, 7),
    (3, 4, 1)
]

print("Graph (5 vertices, 7 edges)")
print("Edges with weights: 0-1(2), 0-3(6), 1-2(3), 1-3(8), 1-4(5), 2-4(7), 3-4(1)\n")

kruskal_mst(vertices, edges)

print("\n=== Kruskal's Algorithm ===")
print("1. Sort edges by weight")
print("2. Use Union-Find DSU")
print("3. For each edge (u,v):")
print("   - If u and v not connected: add to MST")
print("   - Union the two components")
print("4. Continue until V-1 edges added\n")

print("=== Complexity ===")
print("Time Complexity:  O(E log E)")
print("Space Complexity: O(V + E)")
