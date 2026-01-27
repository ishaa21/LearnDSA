// Graph Representation in C#

using System;
using System.Collections.Generic;

class GraphRepresentation {
    private int vertices;
    private int edges;
    private int[,] adjacencyMatrix;
    
    public GraphRepresentation(int v) {
        vertices = v;
        edges = 0;
        adjacencyMatrix = new int[v, v];
    }
    
    public void AddEdge(int u, int v) {
        adjacencyMatrix[u, v] = 1;
        adjacencyMatrix[v, u] = 1;
        edges++;
    }
    
    public void PrintAdjacencyMatrix() {
        Console.WriteLine("Adjacency Matrix:");
        for (int i = 0; i < vertices; i++) {
            for (int j = 0; j < vertices; j++) {
                Console.Write(adjacencyMatrix[i, j] + " ");
            }
            Console.WriteLine();
        }
    }
    
    public void PrintAdjacencyList() {
        Console.WriteLine("Adjacency List:");
        for (int i = 0; i < vertices; i++) {
            Console.Write(i + " -> ");
            for (int j = 0; j < vertices; j++) {
                if (adjacencyMatrix[i, j] == 1) {
                    Console.Write(j + " ");
                }
            }
            Console.WriteLine();
        }
    }
    
    static void Main() {
        Console.WriteLine("=== Graph Representation (C#) ===\n");
        
        GraphRepresentation graph = new GraphRepresentation(5);
        
        graph.AddEdge(0, 1);
        graph.AddEdge(0, 4);
        graph.AddEdge(1, 2);
        graph.AddEdge(1, 3);
        graph.AddEdge(1, 4);
        graph.AddEdge(2, 3);
        graph.AddEdge(3, 4);
        
        Console.WriteLine("Vertices: " + graph.vertices + ", Edges: " + graph.edges + "\n");
        
        graph.PrintAdjacencyMatrix();
        Console.WriteLine();
        graph.PrintAdjacencyList();
        
        Console.WriteLine("\n=== Graph Representation Methods ===");
        Console.WriteLine("1. Adjacency Matrix");
        Console.WriteLine("   - 2D array where arr[i][j] = 1 if edge exists");
        Console.WriteLine("   - Space: O(V²)");
        Console.WriteLine("   - Edge lookup: O(1)\n");
        
        Console.WriteLine("2. Adjacency List");
        Console.WriteLine("   - Array of lists");
        Console.WriteLine("   - Space: O(V + E)");
        Console.WriteLine("   - Edge lookup: O(degree)\n");
        
        Console.WriteLine("=== Complexity Comparison ===");
        Console.WriteLine("Operation        | Adjacency Matrix | Adjacency List");
        Console.WriteLine("Space           | O(V²)           | O(V + E)");
        Console.WriteLine("Add Edge        | O(1)            | O(1)");
        Console.WriteLine("Remove Edge     | O(1)            | O(degree)");
        Console.WriteLine("Check Edge      | O(1)            | O(degree)");
        Console.WriteLine("Get Neighbors   | O(V)            | O(degree)");
    }
}
