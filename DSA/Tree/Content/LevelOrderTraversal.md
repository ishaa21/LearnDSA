# Level Order Traversal

## What is this?
Traversal level by level (Breadth First Search).

## Why do we need it?
- Breadth-first view.
- Shortest path in unweighted graphs.

## Algorithm Logic
- Use **Queue**.
- Enqueue Root.
- Loop: Dequeue node, perform operation, Enqueue children (Left then Right).

## Common Mistakes
- Forgetting to enqueue children
- Using Stack instead of Queue (becomes DFS)

## Time Complexity
O(n)

## Space Complexity
O(n) (Max width of tree)

## Real Life Use
- Social Network (Friends of friends)
- Web Crawler

## Key Takeaways
- BFS traversal
- Queue is essential

## Mini Practice
### Problem: BFS
Print levels of 1 -> (2, 3).
Input: 1 -> (2, 3)
Output: 1, 2, 3
Hint: Queue: [1] -> [2, 3] -> [3] -> [].
Solution: While queue not empty, poll() and add children.
