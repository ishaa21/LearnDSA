# Connected Components

## What is this?
Groups of nodes where each node is reachable from others in the same group.

## Why do we need it?
- Network analysis (Is the network partitioned?)
- Image segmentation

## Algorithm Logic
- Run DFS/BFS loop on all nodes.
- If node `i` is unvisited, it starts a new component. increment count.

## Common Mistakes
- Not resetting visited array for new query
- Missing isolated nodes

## Time Complexity
O(V + E)

## Space Complexity
O(V)

## Real Life Use
- Counting Islands in a map
- Social cliques

## Key Takeaways
- Multiple DFS/BFS runs
- Works for undirected graphs

## Recommended Problems
- Number of Connected Components (LeetCode)
- Connected Components (GFG)

## Mini Practice
### Problem: Count
0-1, 2-3. (4 nodes total).
Input: Edges 0-1, 2-3
Output: 2 Components
Hint: DFS(0) visits 1. DFS(2) visits 3.
Solution: Loop 0 to n. if(!vis[i]) { count++; dfs(i); }
