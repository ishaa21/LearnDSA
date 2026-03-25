# Deletion in Doubly Linked List

## What is this?
Removing node from DLL.

## Why do we need it?
- Cleaning up data.

## Algorithm Logic
Link `prev.next` to `current.next` and `next.prev` to `current.prev`.

## Common Mistakes
- Null pointer (removing head/tail)
- Forgetting to nullify removed node

## Time Complexity
O(n) (To find node) / O(1) (If reference known)

## Space Complexity
O(1)

## Real Life Use
- Removing browser tab

## Key Takeaways
- Patch both directions
- Easier deletion than Singly (as we have prev)

## Mini Practice
### Problem: Delete Middle
Delete 2 from 1 <-> 2 <-> 3.
Input: 1 <-> 2 <-> 3
Output: 1 <-> 3
Hint: 1.next = 3; 3.prev = 1;
Solution: curr.prev.next = curr.next; curr.next.prev = curr.prev;
