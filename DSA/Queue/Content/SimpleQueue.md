# Simple Queue

## What is this?
A simple queue allows insertion at rear and deletion from front.

## Why do we need it?
- To process elements in arrival order.

## Algorithm Logic
1. Insert at rear
2. Remove from front

## Common Mistakes
- Queue overflow
- Queue underflow
- Not updating front/rear properly

## Time Complexity
- Enqueue: O(1)
- Dequeue: O(1)

## Space Complexity
O(n)

## Real Life Use
- Ticket counter line
- Printer job queue

## Key Takeaways
- Basic queue implementation
- FIFO (First In First Out)
- Simple but fixed size

## Mini Practice
### Problem: Basic Queue
Insert 10, 20, 30. Then remove the first element.
Input: Enqueue 10, 20, 30. Dequeue.
Output: Queue: [20, 30]
Hint: Front moves forward on dequeue.
Solution: Front was at 10. Dequeue -> Front moves to 20.

### Problem: Queue from Input
Enqueue elements [10, 20, 30] then dequeue 2 elements. What remains?
Input: Enqueue 10, 20, 30; Dequeue twice
Output: Queue = [30], Front = 30
Hint: FIFO - first two elements (10, 20) are dequeued.
Solution: After enqueue: [10,20,30]. After 2 dequeues: [30].

### Problem: Queue Size
Track queue size after: Enqueue 5, Enqueue 10, Dequeue, Enqueue 15, Enqueue 20, Dequeue.
Input: Operations as described
Output: Final size = 2
Hint: Enqueue adds 1 to size, Dequeue subtracts 1.
Solution: Size changes: 1, 2, 1, 2, 3, 2. Final size = 2.
