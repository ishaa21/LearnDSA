// Minimum Spanning Tree in Java

import java.util.*;

public class MinimumSpanningTree {
    static class Edge implements Comparable<Edge> {
        int u, v, weight;
        
        Edge(int u, int v, int weight) {
            this.u = u;
            this.v = v;
            this.weight = weight;
        }
        
        public int compareTo(Edge other) {
            return this.weight - other.weight;
        }
    }
    
    static class DSU {
        int[] parent;
        int[] rank;
        
        DSU(int n) {
            parent = new int[n];
            rank = new int[n];
            for (int i = 0; i < n; i++) {
                parent[i] = i;
            }
        }
        
        int findParent(int x) {
            if (parent[x] != x) {
                parent[x] = findParent(parent[x]);
            }
            return parent[x];
        }
        
        void unionSets(int x, int y) {
            x = findParent(x);
            y = findParent(y);
            
            if (x != y) {
                if (rank[x] < rank[y]) {
                    parent[x] = y;
                } else if (rank[x] > rank[y]) {
                    parent[y] = x;
                } else {
                    parent[y] = x;
                    rank[x]++;
                }
            }
        }
    }
    
    public static void kruskalMST(int vertices, Edge[] edges) {
        Arrays.sort(edges);
        
        DSU dsu = new DSU(vertices);
        System.out.println("Minimum Spanning Tree (Kruskal's):");
        int mstWeight = 0;
        int mstEdges = 0;
        
        for (Edge e : edges) {
            int x = dsu.findParent(e.u);
            int y = dsu.findParent(e.v);
            
            if (x != y && mstEdges < vertices - 1) {
                System.out.println(e.u + " - " + e.v + ": weight " + e.weight);
                mstWeight += e.weight;
                mstEdges++;
                dsu.unionSets(x, y);
            }
        }
        
        System.out.println("Total MST Weight: " + mstWeight);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Minimum Spanning Tree (Java) ===\n");
        
        int vertices = 5;
        Edge[] edges = {
            new Edge(0, 1, 2),
            new Edge(0, 3, 6),
            new Edge(1, 2, 3),
            new Edge(1, 3, 8),
            new Edge(1, 4, 5),
            new Edge(2, 4, 7),
            new Edge(3, 4, 1)
        };
        
        System.out.println("Graph (5 vertices, 7 edges)");
        System.out.println("Edges with weights: 0-1(2), 0-3(6), 1-2(3), 1-3(8), 1-4(5), 2-4(7), 3-4(1)\n");
        
        kruskalMST(vertices, edges);
        
        System.out.println("\n=== Kruskal's Algorithm ===");
        System.out.println("1. Sort edges by weight");
        System.out.println("2. Use Union-Find DSU");
        System.out.println("3. For each edge (u,v):");
        System.out.println("   - If u and v not connected: add to MST");
        System.out.println("   - Union the two components");
        System.out.println("4. Continue until V-1 edges added\n");
        
        System.out.println("=== Complexity ===");
        System.out.println("Time Complexity:  O(E log E)");
        System.out.println("Space Complexity: O(V + E)");
    }
}
