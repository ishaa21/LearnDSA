# Traversal in Doubly Linked List

## What is this?
Traversing DLL in both directions (Forward/Backward).

## Why do we need it?
- Backward navigation
- Reading from end

## Algorithm Logic
Use `next` for forward, `prev` for backward.

## Common Mistakes
- Wrong traversal direction
- Null check failure

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Music player (Next / Previous Song)
- Slideshow

## Key Takeaways
- Two-way traversal
- More versatile

## Mini Practice
### Problem: Print Backward
Print 3, 2, 1 from 1 <-> 2 <-> 3.
Input: 1 <-> 2 <-> 3
Output: 3, 2, 1
Hint: Go to tail. Then use .prev loop.
Solution: while(tail!=null) print(tail.data); tail=tail.prev;
