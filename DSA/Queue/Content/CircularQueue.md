# Circular Queue

## What is this?
A circular queue connects the last position back to the first.

## Why do we need it?
- To efficiently use memory
- To avoid wasted space in simple queue

## Algorithm Logic
- Use modulo operation: `(index + 1) % size`
- Rear and front wrap around

## Common Mistakes
- Incorrect full/empty condition
- Wrong modulo calculation

## Time Complexity
- Enqueue: O(1)
- Dequeue: O(1)

## Space Complexity
O(n)

## Real Life Use
- CPU scheduling (Round Robin)
- Traffic light cycles

## Key Takeaways
- Efficient memory usage
- Rear connects to front

## Recommended Problems
- Design Circular Queue (LeetCode)
- Circular Queue Implementation (GFG)

## Mini Practice
### Problem: Wrap Around
Queue size 3. Insert 1, 2, 3. Remove 1. Insert 4.
Input: Enq 1, 2, 3. Deq. Enq 4.
Output: Queue full used. 4 inserted at index 0.
Hint: Rear wraps from index 2 to index 0.
Solution: rear = (rear + 1) % size.
