// DFS in Graph in C#

using System;
using System.Collections.Generic;

class DFS_Graph {
    private int vertices;
    private int[,] adjacencyMatrix;
    
    public DFS_Graph(int v) {
        vertices = v;
        adjacencyMatrix = new int[v, v];
    }
    
    public void AddEdge(int u, int v) {
        adjacencyMatrix[u, v] = 1;
        adjacencyMatrix[v, u] = 1;
    }
    
    private void DFSHelper(int u, bool[] visited) {
        visited[u] = true;
        Console.Write(u + " ");
        
        for (int v = 0; v < vertices; v++) {
            if (adjacencyMatrix[u, v] == 1 && !visited[v]) {
                DFSHelper(v, visited);
            }
        }
    }
    
    public void DFSRecursive(int start) {
        bool[] visited = new bool[vertices];
        Console.Write("DFS Traversal (Recursive): ");
        DFSHelper(start, visited);
        Console.WriteLine();
    }
    
    public void DFSIterative(int start) {
        bool[] visited = new bool[vertices];
        Stack<int> s = new Stack<int>();
        
        s.Push(start);
        visited[start] = true;
        
        Console.Write("DFS Traversal (Iterative): ");
        while (s.Count > 0) {
            int u = s.Pop();
            Console.Write(u + " ");
            
            for (int v = 0; v < vertices; v++) {
                if (adjacencyMatrix[u, v] == 1 && !visited[v]) {
                    visited[v] = true;
                    s.Push(v);
                }
            }
        }
        Console.WriteLine();
    }
    
    static void Main() {
        Console.WriteLine("=== DFS in Graph (C#) ===\n");
        
        DFS_Graph graph = new DFS_Graph(5);
        
        graph.AddEdge(0, 1);
        graph.AddEdge(0, 4);
        graph.AddEdge(1, 2);
        graph.AddEdge(1, 3);
        graph.AddEdge(1, 4);
        graph.AddEdge(2, 3);
        graph.AddEdge(3, 4);
        
        Console.WriteLine("Graph (5 vertices, 7 edges)");
        Console.WriteLine("Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n");
        
        graph.DFSRecursive(0);
        graph.DFSIterative(0);
        
        Console.WriteLine("\n=== DFS Algorithm ===");
        Console.WriteLine("1. Mark current vertex as visited");
        Console.WriteLine("2. Process current vertex");
        Console.WriteLine("3. For all unvisited neighbors:");
        Console.WriteLine("   - Recursively call DFS");
        Console.WriteLine("4. Backtrack\n");
        
        Console.WriteLine("=== DFS Complexity ===");
        Console.WriteLine("Time Complexity:  O(V + E)");
        Console.WriteLine("Space Complexity: O(V)");
        Console.WriteLine("Applications: Cycle detection, Topological sort, Connectivity");
    }
}
