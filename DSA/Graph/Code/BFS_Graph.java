// BFS in Graph in Java

import java.util.*;

public class BFS_Graph {
    private int vertices;
    private int[][] adjacencyMatrix;
    
    public BFS_Graph(int v) {
        vertices = v;
        adjacencyMatrix = new int[v][v];
    }
    
    public void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
    }
    
    public void bfs(int start) {
        boolean[] visited = new boolean[vertices];
        Queue<Integer> q = new LinkedList<>();
        
        visited[start] = true;
        q.offer(start);
        
        System.out.print("BFS Traversal: ");
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
    
    public static void main(String[] args) {
        System.out.println("=== BFS in Graph (Java) ===\n");
        
        BFS_Graph graph = new BFS_Graph(5);
        
        graph.addEdge(0, 1);
        graph.addEdge(0, 4);
        graph.addEdge(1, 2);
        graph.addEdge(1, 3);
        graph.addEdge(1, 4);
        graph.addEdge(2, 3);
        graph.addEdge(3, 4);
        
        System.out.println("Graph (5 vertices, 7 edges)");
        System.out.println("Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n");
        
        graph.bfs(0);
        
        System.out.println("\n=== BFS Algorithm ===");
        System.out.println("1. Initialize queue with start vertex");
        System.out.println("2. Mark start vertex as visited");
        System.out.println("3. While queue is not empty:");
        System.out.println("   a. Dequeue and process vertex");
        System.out.println("   b. For all unvisited neighbors:");
        System.out.println("      - Mark as visited");
        System.out.println("      - Enqueue the neighbor");
        System.out.println("4. Continue until queue is empty\n");
        
        System.out.println("=== BFS Complexity ===");
        System.out.println("Time Complexity:  O(V + E)");
        System.out.println("Space Complexity: O(V)");
        System.out.println("Applications: Shortest path, Level-order, Connected components");
    }
}
