// Cycle Detection in Java

import java.util.*;

public class CycleDetection {
    private int vertices;
    private int[][] adjacencyMatrix;
    
    public CycleDetection(int v) {
        vertices = v;
        adjacencyMatrix = new int[v][v];
    }
    
    public void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
    }
    
    private boolean hasCycleDFS(int u, int parent, boolean[] visited) {
        visited[u] = true;
        
        for (int v = 0; v < vertices; v++) {
            if (adjacencyMatrix[u][v] == 1) {
                if (!visited[v]) {
                    if (hasCycleDFS(v, u, visited)) {
                        return true;
                    }
                } else if (v != parent) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    public boolean detectCycle() {
        boolean[] visited = new boolean[vertices];
        
        for (int i = 0; i < vertices; i++) {
            if (!visited[i]) {
                if (hasCycleDFS(i, -1, visited)) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    public static void main(String[] args) {
        System.out.println("=== Cycle Detection (Java) ===\n");
        
        System.out.println("Graph 1 (With Cycle):");
        CycleDetection graph1 = new CycleDetection(4);
        graph1.addEdge(0, 1);
        graph1.addEdge(1, 2);
        graph1.addEdge(2, 3);
        graph1.addEdge(3, 0);
        
        System.out.println("Edges: 0-1, 1-2, 2-3, 3-0 (forms a cycle)");
        System.out.println("Cycle Detected: " + (graph1.detectCycle() ? "Yes" : "No") + "\n");
        
        System.out.println("Graph 2 (Acyclic):");
        CycleDetection graph2 = new CycleDetection(4);
        graph2.addEdge(0, 1);
        graph2.addEdge(1, 2);
        graph2.addEdge(2, 3);
        
        System.out.println("Edges: 0-1, 1-2, 2-3 (no cycle)");
        System.out.println("Cycle Detected: " + (graph2.detectCycle() ? "Yes" : "No") + "\n");
        
        System.out.println("=== Algorithm ===");
        System.out.println("1. Use DFS to traverse graph");
        System.out.println("2. For each vertex, track parent");
        System.out.println("3. If visited neighbor is not parent = cycle found");
        System.out.println("4. Continue for all components\n");
        
        System.out.println("=== Complexity ===");
        System.out.println("Time Complexity:  O(V + E)");
        System.out.println("Space Complexity: O(V)");
    }
}
