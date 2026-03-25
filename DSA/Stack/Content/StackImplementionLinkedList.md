# Stack Implementation (Linked List)

## What is this?
Stack implemented using linked list.

## Why do we need it?
- Dynamic size
- No overflow

## Algorithm Logic
Insert/delete at head

## Common Mistakes
- Memory leaks
- Lost pointers

## Time Complexity
- Push/Pop: O(1)

## Space Complexity
O(n)

## Real Life Use
- Dynamic memory stacks
- Undo mechanisms in text editors

## Key Takeaways
- Dynamic stack
- Extra memory per node

## Mini Practice
### Problem: LL Stack
Push 5 and 10 into a Linked List stack.
Input: Push 5, Push 10
Output: 10 -> 5 -> NULL
Hint: Add new node at head.
Solution: newNode.next = head; head = newNode;
