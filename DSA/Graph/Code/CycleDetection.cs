// Cycle Detection in C#

using System;
using System.Collections.Generic;

class CycleDetection {
    private int vertices;
    private int[,] adjacencyMatrix;
    
    public CycleDetection(int v) {
        vertices = v;
        adjacencyMatrix = new int[v, v];
    }
    
    public void AddEdge(int u, int v) {
        adjacencyMatrix[u, v] = 1;
        adjacencyMatrix[v, u] = 1;
    }
    
    private bool HasCycleDFS(int u, int parent, bool[] visited) {
        visited[u] = true;
        
        for (int v = 0; v < vertices; v++) {
            if (adjacencyMatrix[u, v] == 1) {
                if (!visited[v]) {
                    if (HasCycleDFS(v, u, visited)) {
                        return true;
                    }
                } else if (v != parent) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    public bool DetectCycle() {
        bool[] visited = new bool[vertices];
        
        for (int i = 0; i < vertices; i++) {
            if (!visited[i]) {
                if (HasCycleDFS(i, -1, visited)) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    static void Main() {
        Console.WriteLine("=== Cycle Detection (C#) ===\n");
        
        Console.WriteLine("Graph 1 (With Cycle):");
        CycleDetection graph1 = new CycleDetection(4);
        graph1.AddEdge(0, 1);
        graph1.AddEdge(1, 2);
        graph1.AddEdge(2, 3);
        graph1.AddEdge(3, 0);
        
        Console.WriteLine("Edges: 0-1, 1-2, 2-3, 3-0 (forms a cycle)");
        Console.WriteLine("Cycle Detected: " + (graph1.DetectCycle() ? "Yes" : "No") + "\n");
        
        Console.WriteLine("Graph 2 (Acyclic):");
        CycleDetection graph2 = new CycleDetection(4);
        graph2.AddEdge(0, 1);
        graph2.AddEdge(1, 2);
        graph2.AddEdge(2, 3);
        
        Console.WriteLine("Edges: 0-1, 1-2, 2-3 (no cycle)");
        Console.WriteLine("Cycle Detected: " + (graph2.DetectCycle() ? "Yes" : "No") + "\n");
        
        Console.WriteLine("=== Algorithm ===");
        Console.WriteLine("1. Use DFS to traverse graph");
        Console.WriteLine("2. For each vertex, track parent");
        Console.WriteLine("3. If visited neighbor is not parent = cycle found");
        Console.WriteLine("4. Continue for all components\n");
        
        Console.WriteLine("=== Complexity ===");
        Console.WriteLine("Time Complexity:  O(V + E)");
        Console.WriteLine("Space Complexity: O(V)");
    }
}
