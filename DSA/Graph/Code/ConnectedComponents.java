// Connected Components in Java

import java.util.*;

public class ConnectedComponents {
    private int vertices;
    private int[][] adjacencyMatrix;
    
    public ConnectedComponents(int v) {
        vertices = v;
        adjacencyMatrix = new int[v][v];
    }
    
    public void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
    }
    
    public void findComponents() {
        boolean[] visited = new boolean[vertices];
        int component = 0;
        
        System.out.println("Connected Components:");
        for (int i = 0; i < vertices; i++) {
            if (!visited[i]) {
                System.out.print("Component " + (++component) + ": ");
                
                Queue<Integer> q = new LinkedList<>();
                q.offer(i);
                visited[i] = true;
                
                while (!q.isEmpty()) {
                    int u = q.poll();
                    System.out.print(u + " ");
                    
                    for (int v = 0; v < vertices; v++) {
                        if (adjacencyMatrix[u][v] == 1 && !visited[v]) {
                            visited[v] = true;
                            q.offer(v);
                        }
                    }
                }
                System.out.println();
            }
        }
    }
    
    public static void main(String[] args) {
        System.out.println("=== Connected Components (Java) ===\n");
        
        ConnectedComponents graph = new ConnectedComponents(6);
        
        graph.addEdge(0, 1);
        graph.addEdge(0, 2);
        graph.addEdge(3, 4);
        
        System.out.println("Graph (6 vertices):");
        System.out.println("Component 1: 0-1, 0-2");
        System.out.println("Component 2: 3-4");
        System.out.println("Isolated: 5\n");
        
        graph.findComponents();
        
        System.out.println("\n=== Algorithm ===");
        System.out.println("1. Initialize all vertices as unvisited");
        System.out.println("2. For each unvisited vertex:");
        System.out.println("   a. Start BFS/DFS from that vertex");
        System.out.println("   b. Mark all reachable vertices as visited");
        System.out.println("   c. This forms one connected component");
        System.out.println("3. Repeat until all vertices visited\n");
        
        System.out.println("=== Complexity ===");
        System.out.println("Time Complexity:  O(V + E)");
        System.out.println("Space Complexity: O(V)");
    }
}
