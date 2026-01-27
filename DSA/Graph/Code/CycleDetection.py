# Cycle Detection in Python

class CycleDetection:
    def __init__(self, vertices):
        self.vertices = vertices
        self.adjacency_matrix = [[0] * vertices for _ in range(vertices)]
    
    def add_edge(self, u, v):
        self.adjacency_matrix[u][v] = 1
        self.adjacency_matrix[v][u] = 1
    
    def has_cycle_dfs(self, u, parent, visited):
        visited[u] = True
        
        for v in range(self.vertices):
            if self.adjacency_matrix[u][v]:
                if not visited[v]:
                    if self.has_cycle_dfs(v, u, visited):
                        return True
                elif v != parent:
                    return True
        
        return False
    
    def detect_cycle(self):
        visited = [False] * self.vertices
        
        for i in range(self.vertices):
            if not visited[i]:
                if self.has_cycle_dfs(i, -1, visited):
                    return True
        
        return False

# Test
print("=== Cycle Detection (Python) ===\n")

print("Graph 1 (With Cycle):")
graph1 = CycleDetection(4)
graph1.add_edge(0, 1)
graph1.add_edge(1, 2)
graph1.add_edge(2, 3)
graph1.add_edge(3, 0)

print("Edges: 0-1, 1-2, 2-3, 3-0 (forms a cycle)")
print(f"Cycle Detected: {'Yes' if graph1.detect_cycle() else 'No'}\n")

print("Graph 2 (Acyclic):")
graph2 = CycleDetection(4)
graph2.add_edge(0, 1)
graph2.add_edge(1, 2)
graph2.add_edge(2, 3)

print("Edges: 0-1, 1-2, 2-3 (no cycle)")
print(f"Cycle Detected: {'Yes' if graph2.detect_cycle() else 'No'}\n")

print("=== Algorithm ===")
print("1. Use DFS to traverse graph")
print("2. For each vertex, track parent")
print("3. If visited neighbor is not parent = cycle found")
print("4. Continue for all components\n")

print("=== Complexity ===")
print("Time Complexity:  O(V + E)")
print("Space Complexity: O(V)")
