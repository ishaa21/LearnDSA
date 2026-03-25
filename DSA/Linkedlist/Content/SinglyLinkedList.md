# Singly Linked List

## What is this?
Each node points to the next node only. It moves in only one direction.

## Why do we need it?
- Simple and memory efficient (only 1 pointer per node).

## Algorithm Logic
- Traverse using next pointer
- Stop when `next` is null

## Common Mistakes
- Forgetting null termination
- Losing the head pointer

## Time Complexity
Traversal: O(n)

## Space Complexity
O(n)

## Real Life Use
- Forward-only navigation

## Key Takeaways
- One-direction traversal
- Simple structure

## Mini Practice
### Problem: Insert & Print
Insert 1, 2, 3 into a list and print it.
Input: 1, 2, 3
Output: 1 -> 2 -> 3 -> null
Hint: Head -> Node(1) -> Node(2)...
Solution: Loop through list printing data.
