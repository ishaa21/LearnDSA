# Doubly Linked List

## What is this?
Each node has previous and next references.

## Why do we need it?
- Two-way traversal
- Easy deletion (can look back)

## Algorithm Logic
Maintain `prev` and `next` pointers.

## Common Mistakes
- Not updating both pointers
- Infinite loops if pointers messed up

## Time Complexity
Traversal: O(n)

## Space Complexity
O(n)

## Real Life Use
- Text editor (Undo/Redo)
- Navigation History

## Key Takeaways
- Extra memory, more flexibility
- Bidirectional

## Recommended Problems
- Doubly Linked List (GFG)

## Mini Practice
### Problem: Backward Travel
Create 1 <-> 2 <-> 3. Traverse from tail to head.
Input: 1, 2, 3
Output: 3, 2, 1
Hint: Start at tail. Use .prev.
Solution: while(curr != null) print(curr.data); curr = curr.prev;
