# Cycle Detection

## What is this?
Checking if graph contains a loop (A path starts and ends at same node).

## Why do we need it?
- Deadlock detection in OS
- Valid dependency checking (Circular dependency)

## Algorithm Logic
- **Undirected**: DFS. If we see a visited neighbor that is NOT parent -> Cycle.
- **Directed**: DFS. If we see node in current recursion stack -> Cycle.

## Common Mistakes
- Using wrong method for graph type
- Ignoring parent pointer in undirected

## Time Complexity
O(V + E)

## Space Complexity
O(V)

## Real Life Use
- GitHub (Circular dependency warning)
- Wait-for graphs

## Key Takeaways
- Different logic for directed/undirected
- Back-edge detection

## Mini Practice
### Problem: Has Cycle?
0-1-2-0.
Input: Triangle graph
Output: True
Hint: DFS(0) -> 1 -> 2. 2 sees 0 (visited & not parent). Cycle!
Solution: pass parent in DFS.
