// BFS in Graph in C#

using System;
using System.Collections.Generic;

class BFS_Graph {
    private int vertices;
    private int[,] adjacencyMatrix;
    
    public BFS_Graph(int v) {
        vertices = v;
        adjacencyMatrix = new int[v, v];
    }
    
    public void AddEdge(int u, int v) {
        adjacencyMatrix[u, v] = 1;
        adjacencyMatrix[v, u] = 1;
    }
    
    public void BFS(int start) {
        bool[] visited = new bool[vertices];
        Queue<int> q = new Queue<int>();
        
        visited[start] = true;
        q.Enqueue(start);
        
        Console.Write("BFS Traversal: ");
        while (q.Count > 0) {
            int u = q.Dequeue();
            Console.Write(u + " ");
            
            for (int v = 0; v < vertices; v++) {
                if (adjacencyMatrix[u, v] == 1 && !visited[v]) {
                    visited[v] = true;
                    q.Enqueue(v);
                }
            }
        }
        Console.WriteLine();
    }
    
    static void Main() {
        Console.WriteLine("=== BFS in Graph (C#) ===\n");
        
        BFS_Graph graph = new BFS_Graph(5);
        
        graph.AddEdge(0, 1);
        graph.AddEdge(0, 4);
        graph.AddEdge(1, 2);
        graph.AddEdge(1, 3);
        graph.AddEdge(1, 4);
        graph.AddEdge(2, 3);
        graph.AddEdge(3, 4);
        
        Console.WriteLine("Graph (5 vertices, 7 edges)");
        Console.WriteLine("Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n");
        
        graph.BFS(0);
        
        Console.WriteLine("\n=== BFS Algorithm ===");
        Console.WriteLine("1. Initialize queue with start vertex");
        Console.WriteLine("2. Mark start vertex as visited");
        Console.WriteLine("3. While queue is not empty:");
        Console.WriteLine("   a. Dequeue and process vertex");
        Console.WriteLine("   b. For all unvisited neighbors:");
        Console.WriteLine("      - Mark as visited");
        Console.WriteLine("      - Enqueue the neighbor");
        Console.WriteLine("4. Continue until queue is empty\n");
        
        Console.WriteLine("=== BFS Complexity ===");
        Console.WriteLine("Time Complexity:  O(V + E)");
        Console.WriteLine("Space Complexity: O(V)");
        Console.WriteLine("Applications: Shortest path, Level-order, Connected components");
    }
}
