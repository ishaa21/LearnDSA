# BFS in Graph in Python

from collections import deque

class BFSGraph:
    def __init__(self, vertices):
        self.vertices = vertices
        self.adjacency_matrix = [[0] * vertices for _ in range(vertices)]
    
    def add_edge(self, u, v):
        self.adjacency_matrix[u][v] = 1
        self.adjacency_matrix[v][u] = 1
    
    def bfs(self, start):
        visited = [False] * self.vertices
        queue = deque([start])
        visited[start] = True
        
        print("BFS Traversal: ", end="")
        while queue:
            u = queue.popleft()
            print(u, end=" ")
            
            for v in range(self.vertices):
                if self.adjacency_matrix[u][v] and not visited[v]:
                    visited[v] = True
                    queue.append(v)
        
        print()

# Test
print("=== BFS in Graph (Python) ===\n")

graph = BFSGraph(5)

graph.add_edge(0, 1)
graph.add_edge(0, 4)
graph.add_edge(1, 2)
graph.add_edge(1, 3)
graph.add_edge(1, 4)
graph.add_edge(2, 3)
graph.add_edge(3, 4)

print("Graph (5 vertices, 7 edges)")
print("Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n")

graph.bfs(0)

print("\n=== BFS Algorithm ===")
print("1. Initialize queue with start vertex")
print("2. Mark start vertex as visited")
print("3. While queue is not empty:")
print("   a. Dequeue and process vertex")
print("   b. For all unvisited neighbors:")
print("      - Mark as visited")
print("      - Enqueue the neighbor")
print("4. Continue until queue is empty\n")

print("=== BFS Complexity ===")
print("Time Complexity:  O(V + E)")
print("Space Complexity: O(V)")
print("Applications: Shortest path, Level-order, Connected components")
