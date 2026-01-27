// Connected Components in C#

using System;
using System.Collections.Generic;

class ConnectedComponents {
    private int vertices;
    private int[,] adjacencyMatrix;
    
    public ConnectedComponents(int v) {
        vertices = v;
        adjacencyMatrix = new int[v, v];
    }
    
    public void AddEdge(int u, int v) {
        adjacencyMatrix[u, v] = 1;
        adjacencyMatrix[v, u] = 1;
    }
    
    public void FindComponents() {
        bool[] visited = new bool[vertices];
        int component = 0;
        
        Console.WriteLine("Connected Components:");
        for (int i = 0; i < vertices; i++) {
            if (!visited[i]) {
                Console.Write("Component " + (++component) + ": ");
                
                Queue<int> q = new Queue<int>();
                q.Enqueue(i);
                visited[i] = true;
                
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
        }
    }
    
    static void Main() {
        Console.WriteLine("=== Connected Components (C#) ===\n");
        
        ConnectedComponents graph = new ConnectedComponents(6);
        
        graph.AddEdge(0, 1);
        graph.AddEdge(0, 2);
        graph.AddEdge(3, 4);
        
        Console.WriteLine("Graph (6 vertices):");
        Console.WriteLine("Component 1: 0-1, 0-2");
        Console.WriteLine("Component 2: 3-4");
        Console.WriteLine("Isolated: 5\n");
        
        graph.FindComponents();
        
        Console.WriteLine("\n=== Algorithm ===");
        Console.WriteLine("1. Initialize all vertices as unvisited");
        Console.WriteLine("2. For each unvisited vertex:");
        Console.WriteLine("   a. Start BFS/DFS from that vertex");
        Console.WriteLine("   b. Mark all reachable vertices as visited");
        Console.WriteLine("   c. This forms one connected component");
        Console.WriteLine("3. Repeat until all vertices visited\n");
        
        Console.WriteLine("=== Complexity ===");
        Console.WriteLine("Time Complexity:  O(V + E)");
        Console.WriteLine("Space Complexity: O(V)");
    }
}
