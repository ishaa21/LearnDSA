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

## Mini Practice
### Problem: Wrap Around
Queue size 3. Insert 1, 2, 3. Remove 1. Insert 4.
Input: Enq 1, 2, 3. Deq. Enq 4.
Output: Queue full used. 4 inserted at index 0.
Hint: Rear wraps from index 2 to index 0.
Solution: rear = (rear + 1) % size.

### Problem: Wrap Around Insertion
In a circular queue of size 5 with elements at indices 3,4, enqueue 3 more elements.
Input: Size=5, elements at [3,4], enqueue 10, 20, 30
Output: Elements wrap to indices 0, 1, 2
Hint: After reaching the end, wrap using modulo: (rear+1) % size.
Solution: Next positions: (4+1)%5=0, (0+1)%5=1, (1+1)%5=2.

### Problem: Full Check
How to distinguish between full and empty circular queue?
Input: (None)
Output: Full: (rear+1)%size == front. Empty: front == -1 or front == rear+1.
Hint: Keep a count variable or leave one cell empty.
Solution: Use count variable. Full when count==size, empty when count==0.
