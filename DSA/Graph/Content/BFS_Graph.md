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

## Mini Practice
### Problem: BFS Order
Start BFS from 0 in 0-1, 0-2.
Input: 0 connected to 1 and 2
Output: 0, 1, 2
Hint: Queue: [0]. Pop 0, push 1, 2.
Solution: q.add(0); visited[0]=true;

### Problem: Shortest Path Length
Find shortest path from 0 to 4 in graph: 0-1, 0-2, 1-3, 2-3, 3-4.
Input: Edges: 0-1, 0-2, 1-3, 2-3, 3-4. Start=0, End=4
Output: Shortest path length = 3 (0->1->3->4 or 0->2->3->4)
Hint: BFS explores level by level, first time reaching a node is shortest path.
Solution: BFS from 0. Level 0: {0}, Level 1: {1,2}, Level 2: {3}, Level 3: {4}. Distance = 3.

### Problem: Level Order Print
Print all nodes at each level starting from node 0.
Input: 0-1, 0-2, 1-3, 1-4, 2-5
Output: Level 0: [0], Level 1: [1,2], Level 2: [3,4,5]
Hint: Use a queue and track level changes.
Solution: Use BFS with a marker for each level boundary.
