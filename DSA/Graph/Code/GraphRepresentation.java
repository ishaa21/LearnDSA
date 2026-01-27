// Graph Representation in Java

import java.util.*;

public class GraphRepresentation {
    private int vertices;
    private int edges;
    private int[][] adjacencyMatrix;
    
    public GraphRepresentation(int v) {
        vertices = v;
        edges = 0;
        adjacencyMatrix = new int[v][v];
    }
    
    public void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
        edges++;
    }
    
    public void printAdjacencyMatrix() {
        System.out.println("Adjacency Matrix:");
        for (int i = 0; i < vertices; i++) {
            for (int j = 0; j < vertices; j++) {
                System.out.print(adjacencyMatrix[i][j] + " ");
            }
            System.out.println();
        }
    }
    
    public void printAdjacencyList() {
        System.out.println("Adjacency List:");
        for (int i = 0; i < vertices; i++) {
            System.out.print(i + " -> ");
            for (int j = 0; j < vertices; j++) {
                if (adjacencyMatrix[i][j] == 1) {
                    System.out.print(j + " ");
                }
            }
            System.out.println();
        }
    }
    
    public static void main(String[] args) {
        System.out.println("=== Graph Representation (Java) ===\n");
        
        GraphRepresentation graph = new GraphRepresentation(5);
        
        graph.addEdge(0, 1);
        graph.addEdge(0, 4);
        graph.addEdge(1, 2);
        graph.addEdge(1, 3);
        graph.addEdge(1, 4);
        graph.addEdge(2, 3);
        graph.addEdge(3, 4);
        
        System.out.println("Vertices: " + graph.vertices + ", Edges: " + graph.edges + "\n");
        
        graph.printAdjacencyMatrix();
        System.out.println();
        graph.printAdjacencyList();
        
        System.out.println("\n=== Graph Representation Methods ===");
        System.out.println("1. Adjacency Matrix");
        System.out.println("   - 2D array where arr[i][j] = 1 if edge exists");
        System.out.println("   - Space: O(V²)");
        System.out.println("   - Edge lookup: O(1)\n");
        
        System.out.println("2. Adjacency List");
        System.out.println("   - Array of lists");
        System.out.println("   - Space: O(V + E)");
        System.out.println("   - Edge lookup: O(degree)\n");
        
        System.out.println("=== Complexity Comparison ===");
        System.out.println("Operation        | Adjacency Matrix | Adjacency List");
        System.out.println("Space           | O(V²)           | O(V + E)");
        System.out.println("Add Edge        | O(1)            | O(1)");
        System.out.println("Remove Edge     | O(1)            | O(degree)");
        System.out.println("Check Edge      | O(1)            | O(degree)");
        System.out.println("Get Neighbors   | O(V)            | O(degree)");
    }
}
