# Graph Representation in Python

class Graph:
    def __init__(self, vertices):
        self.vertices = vertices
        self.edges = 0
        self.adjacency_matrix = [[0] * vertices for _ in range(vertices)]
    
    def add_edge(self, u, v):
        self.adjacency_matrix[u][v] = 1
        self.adjacency_matrix[v][u] = 1
        self.edges += 1
    
    def print_adjacency_matrix(self):
        print("Adjacency Matrix:")
        for i in range(self.vertices):
            print(self.adjacency_matrix[i])
    
    def print_adjacency_list(self):
        print("Adjacency List:")
        for i in range(self.vertices):
            neighbors = [j for j in range(self.vertices) if self.adjacency_matrix[i][j]]
            print(f"{i} -> {neighbors}")

# Test
print("=== Graph Representation (Python) ===\n")

graph = Graph(5)

graph.add_edge(0, 1)
graph.add_edge(0, 4)
graph.add_edge(1, 2)
graph.add_edge(1, 3)
graph.add_edge(1, 4)
graph.add_edge(2, 3)
graph.add_edge(3, 4)

print(f"Vertices: {graph.vertices}, Edges: {graph.edges}\n")

graph.print_adjacency_matrix()
print()
graph.print_adjacency_list()

print("\n=== Graph Representation Methods ===")
print("1. Adjacency Matrix")
print("   - 2D array where arr[i][j] = 1 if edge exists")
print("   - Space: O(V²)")
print("   - Edge lookup: O(1)\n")

print("2. Adjacency List")
print("   - Array of lists")
print("   - Space: O(V + E)")
print("   - Edge lookup: O(degree)\n")

print("=== Complexity Comparison ===")
print("Operation        | Adjacency Matrix | Adjacency List")
print("Space           | O(V²)           | O(V + E)")
print("Add Edge        | O(1)            | O(1)")
print("Remove Edge     | O(1)            | O(degree)")
print("Check Edge      | O(1)            | O(degree)")
print("Get Neighbors   | O(V)            | O(degree)")
