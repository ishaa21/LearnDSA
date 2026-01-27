# Graph Representation

## What is this?
Ways to store a graph in memory. A graph consists of Vertices (V) and Edges (E).

## Why do we need it?
- Efficient traversal (BFS/DFS)
- Memory optimization depending on graph density

## Algorithm Logic
1. **Adjacency Matrix**: 2D array where `mat[i][j] = 1` if edge exists.
2. **Adjacency List**: Array of Lists where `arr[i]` contains all neighbors of `i`.

## Common Mistakes
- Using Matrix for large sparse graphs (Memory Limit Exceeded)
- Wrong indexing (0-based vs 1-based)

## Time Complexity
- Matrix Access: O(1)
- List Traversal: O(degree)

## Space Complexity
- Matrix: O(V²)
- List: O(V + E)

## Real Life Use
- Social Graph (Facebook Friends - Adj List)
- City Distances (Dense Map - Adj Matrix)

## Key Takeaways
- Adjacency list is preferred for most problems
- Representation affects algorithm performance

## Recommended Problems
- Graph Representation (GFG)
- Find the Town Judge (LeetCode)

## Mini Practice
### Problem: Adj List
Create adjacency list for: 0-1, 0-2.
Input: 2 edges: 0-1, 0-2
Output: 0: [1, 2], 1: [0], 2: [0]
Hint: List<List<Integer>> adj.
Solution: adj.get(0).add(1); adj.get(1).add(0);
