# Priority Queue

## What is this?
A priority queue removes elements based on priority, not order.

## Why do we need it?
- Task scheduling
- Finding min/max quickly

## Algorithm Logic
- Use heap structure
- Highest/lowest priority first

## Common Mistakes
- Assuming FIFO behavior
- Wrong comparator usage

## Time Complexity
- Insert: O(log n)
- Delete: O(log n)

## Space Complexity
O(n)

## Real Life Use
- Hospital Triage (Emergency patients first)
- Dijkstra's pathfinding algorithm

## Key Takeaways
- Order depends on priority
- Commonly implemented using heap

## Mini Practice
### Problem: Priority
Insert 10, 30, 20. Remove max.
Input: 10, 30, 20
Output: Removed 30
Hint: Max Priority Queue puts largest item at top.
Solution: pq.add(10); pq.add(30); pq.add(20); print(pq.poll());
