# Connected Components in Python

from collections import deque

class ConnectedComponents:
    def __init__(self, vertices):
        self.vertices = vertices
        self.adjacency_matrix = [[0] * vertices for _ in range(vertices)]
    
    def add_edge(self, u, v):
        self.adjacency_matrix[u][v] = 1
        self.adjacency_matrix[v][u] = 1
    
    def find_components(self):
        visited = [False] * self.vertices
        component = 0
        
        print("Connected Components:")
        for i in range(self.vertices):
            if not visited[i]:
                print(f"Component {component + 1}: ", end="")
                component += 1
                
                queue = deque([i])
                visited[i] = True
                
                while queue:
                    u = queue.popleft()
                    print(u, end=" ")
                    
                    for v in range(self.vertices):
                        if self.adjacency_matrix[u][v] and not visited[v]:
                            visited[v] = True
                            queue.append(v)
                
                print()

# Test
print("=== Connected Components (Python) ===\n")

graph = ConnectedComponents(6)

graph.add_edge(0, 1)
graph.add_edge(0, 2)
graph.add_edge(3, 4)

print("Graph (6 vertices):")
print("Component 1: 0-1, 0-2")
print("Component 2: 3-4")
print("Isolated: 5\n")

graph.find_components()

print("\n=== Algorithm ===")
print("1. Initialize all vertices as unvisited")
print("2. For each unvisited vertex:")
print("   a. Start BFS/DFS from that vertex")
print("   b. Mark all reachable vertices as visited")
print("   c. This forms one connected component")
print("3. Repeat until all vertices visited\n")

print("=== Complexity ===")
print("Time Complexity:  O(V + E)")
print("Space Complexity: O(V)")
