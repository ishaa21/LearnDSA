// Minimum Spanning Tree in C#

using System;
using System.Collections.Generic;
using System.Linq;

class MinimumSpanningTree {
    class Edge : IComparable<Edge> {
        public int u, v, weight;
        
        public Edge(int u, int v, int weight) {
            this.u = u;
            this.v = v;
            this.weight = weight;
        }
        
        public int CompareTo(Edge other) {
            return this.weight - other.weight;
        }
    }
    
    class DSU {
        int[] parent;
        int[] rank;
        
        public DSU(int n) {
            parent = new int[n];
            rank = new int[n];
            for (int i = 0; i < n; i++) {
                parent[i] = i;
            }
        }
        
        public int FindParent(int x) {
            if (parent[x] != x) {
                parent[x] = FindParent(parent[x]);
            }
            return parent[x];
        }
        
        public void UnionSets(int x, int y) {
            x = FindParent(x);
            y = FindParent(y);
            
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
    
    public static void KruskalMST(int vertices, Edge[] edges) {
        Array.Sort(edges);
        
        DSU dsu = new DSU(vertices);
        Console.WriteLine("Minimum Spanning Tree (Kruskal's):");
        int mstWeight = 0;
        int mstEdges = 0;
        
        foreach (Edge e in edges) {
            int x = dsu.FindParent(e.u);
            int y = dsu.FindParent(e.v);
            
            if (x != y && mstEdges < vertices - 1) {
                Console.WriteLine(e.u + " - " + e.v + ": weight " + e.weight);
                mstWeight += e.weight;
                mstEdges++;
                dsu.UnionSets(x, y);
            }
        }
        
        Console.WriteLine("Total MST Weight: " + mstWeight);
    }
    
    static void Main() {
        Console.WriteLine("=== Minimum Spanning Tree (C#) ===\n");
        
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
        
        Console.WriteLine("Graph (5 vertices, 7 edges)");
        Console.WriteLine("Edges with weights: 0-1(2), 0-3(6), 1-2(3), 1-3(8), 1-4(5), 2-4(7), 3-4(1)\n");
        
        KruskalMST(vertices, edges);
        
        Console.WriteLine("\n=== Kruskal's Algorithm ===");
        Console.WriteLine("1. Sort edges by weight");
        Console.WriteLine("2. Use Union-Find DSU");
        Console.WriteLine("3. For each edge (u,v):");
        Console.WriteLine("   - If u and v not connected: add to MST");
        Console.WriteLine("   - Union the two components");
        Console.WriteLine("4. Continue until V-1 edges added\n");
        
        Console.WriteLine("=== Complexity ===");
        Console.WriteLine("Time Complexity:  O(E log E)");
        Console.WriteLine("Space Complexity: O(V + E)");
    }
}
