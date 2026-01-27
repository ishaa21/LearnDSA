# BFS Graph

## What is this?
Breadth First Search visits nodes level by level (Layerwise).

## Why do we need it?
- Shortest path in unweighted graph
- Level order traversal
- Peer-to-peer networks

## Algorithm Logic
- Use **Queue**
- Enqueue start node and mark visited
- While queue not empty: Dequeue, visit all unvisited neighbors, Enqueue them.

## Common Mistakes
- Forgetting visited array (Infinite loop)
- Not handling disconnected components

## Time Complexity
O(V + E)

## Space Complexity
O(V)

## Real Life Use
- GPS Navigation (Shortest route)
- Broadcasting in Network

## Key Takeaways
- Uses Queue
- Explores nearest nodes first

## Recommended Problems
- Number of Islands (LeetCode)
- BFS of Graph (GFG)

## Mini Practice
### Problem: BFS Order
Start BFS from 0 in 0-1, 0-2.
Input: 0 connected to 1 and 2
Output: 0, 1, 2
Hint: Queue: [0]. Pop 0, push 1, 2.
Solution: q.add(0); visited[0]=true;
