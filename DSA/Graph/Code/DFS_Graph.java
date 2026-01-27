// DFS in Graph in Java

import java.util.*;

public class DFS_Graph {
    private int vertices;
    private int[][] adjacencyMatrix;
    
    public DFS_Graph(int v) {
        vertices = v;
        adjacencyMatrix = new int[v][v];
    }
    
    public void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
    }
    
    private void dfsHelper(int u, boolean[] visited) {
        visited[u] = true;
        System.out.print(u + " ");
        
        for (int v = 0; v < vertices; v++) {
            if (adjacencyMatrix[u][v] == 1 && !visited[v]) {
                dfsHelper(v, visited);
            }
        }
    }
    
    public void dfsRecursive(int start) {
        boolean[] visited = new boolean[vertices];
        System.out.print("DFS Traversal (Recursive): ");
        dfsHelper(start, visited);
        System.out.println();
    }
    
    public void dfsIterative(int start) {
        boolean[] visited = new boolean[vertices];
        Stack<Integer> s = new Stack<>();
        
        s.push(start);
        visited[start] = true;
        
        System.out.print("DFS Traversal (Iterative): ");
        while (!s.isEmpty()) {
            int u = s.pop();
            System.out.print(u + " ");
            
            for (int v = 0; v < vertices; v++) {
                if (adjacencyMatrix[u][v] == 1 && !visited[v]) {
                    visited[v] = true;
                    s.push(v);
                }
            }
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        System.out.println("=== DFS in Graph (Java) ===\n");
        
        DFS_Graph graph = new DFS_Graph(5);
        
        graph.addEdge(0, 1);
        graph.addEdge(0, 4);
        graph.addEdge(1, 2);
        graph.addEdge(1, 3);
        graph.addEdge(1, 4);
        graph.addEdge(2, 3);
        graph.addEdge(3, 4);
        
        System.out.println("Graph (5 vertices, 7 edges)");
        System.out.println("Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n");
        
        graph.dfsRecursive(0);
        graph.dfsIterative(0);
        
        System.out.println("\n=== DFS Algorithm ===");
        System.out.println("1. Mark current vertex as visited");
        System.out.println("2. Process current vertex");
        System.out.println("3. For all unvisited neighbors:");
        System.out.println("   - Recursively call DFS");
        System.out.println("4. Backtrack\n");
        
        System.out.println("=== DFS Complexity ===");
        System.out.println("Time Complexity:  O(V + E)");
        System.out.println("Space Complexity: O(V)");
        System.out.println("Applications: Cycle detection, Topological sort, Connectivity");
    }
}
