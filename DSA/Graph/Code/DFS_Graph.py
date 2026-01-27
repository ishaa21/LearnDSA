# DFS in Graph in Python

class DFSGraph:
    def __init__(self, vertices):
        self.vertices = vertices
        self.adjacency_matrix = [[0] * vertices for _ in range(vertices)]
    
    def add_edge(self, u, v):
        self.adjacency_matrix[u][v] = 1
        self.adjacency_matrix[v][u] = 1
    
    def dfs_recursive_helper(self, u, visited):
        visited[u] = True
        print(u, end=" ")
        
        for v in range(self.vertices):
            if self.adjacency_matrix[u][v] and not visited[v]:
                self.dfs_recursive_helper(v, visited)
    
    def dfs_recursive(self, start):
        visited = [False] * self.vertices
        print("DFS Traversal (Recursive): ", end="")
        self.dfs_recursive_helper(start, visited)
        print()
    
    def dfs_iterative(self, start):
        visited = [False] * self.vertices
        stack = [start]
        visited[start] = True
        
        print("DFS Traversal (Iterative): ", end="")
        while stack:
            u = stack.pop()
            print(u, end=" ")
            
            for v in range(self.vertices):
                if self.adjacency_matrix[u][v] and not visited[v]:
                    visited[v] = True
                    stack.append(v)
        
        print()

# Test
print("=== DFS in Graph (Python) ===\n")

graph = DFSGraph(5)

graph.add_edge(0, 1)
graph.add_edge(0, 4)
graph.add_edge(1, 2)
graph.add_edge(1, 3)
graph.add_edge(1, 4)
graph.add_edge(2, 3)
graph.add_edge(3, 4)

print("Graph (5 vertices, 7 edges)")
print("Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n")

graph.dfs_recursive(0)
graph.dfs_iterative(0)

print("\n=== DFS Algorithm ===")
print("1. Mark current vertex as visited")
print("2. Process current vertex")
print("3. For all unvisited neighbors:")
print("   - Recursively call DFS")
print("4. Backtrack\n")

print("=== DFS Complexity ===")
print("Time Complexity:  O(V + E)")
print("Space Complexity: O(V)")
print("Applications: Cycle detection, Topological sort, Connectivity")
