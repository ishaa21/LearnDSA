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

## Recommended Problems
- Queue Operations (GFG)
- Queue using Array (HackerRank)

## Mini Practice
### Problem: Basic Queue
Insert 10, 20, 30. Then remove the first element.
Input: Enqueue 10, 20, 30. Dequeue.
Output: Queue: [20, 30]
Hint: Front moves forward on dequeue.
Solution: Front was at 10. Dequeue -> Front moves to 20.
