# Detect Cycle in Doubly Linked List

## What is this?
Detect loop in doubly linked list.

## Why do we need it?
- Prevent infinite traversal.

## Algorithm Logic
Similar to Singly LL (Fast/Slow pointers).

## Common Mistakes
- Ignoring backward links

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Debugging complex structures

## Key Takeaways
- Similar to singly but with extra care

## Recommended Problems
- Detect Loop in DLL (GFG)

## Mini Practice
### Problem: Is Cyclic
1 <-> 2 <-> 1 (Valid DLL) vs 1 -> 2 -> 1 (Loop).
Input: DLL with loop.
Output: True
Hint: Ignore prev pointers, treat as singly for cycle check.
Solution: Use Floyd's algorithm.
