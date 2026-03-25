# Traversal in Linked List

## What is this?
Visiting each node once.

## Why do we need it?
- To read or process data.

## Algorithm Logic
Loop until `current` is null.

## Common Mistakes
- Infinite loop (if circular without break)
- Accessing .next on null

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Reading a book page by page
- Displaying list items

## Key Takeaways
- Fundamental operation
- Linear time

## Mini Practice
### Problem: Print All
Print all nodes in 1 -> 2 -> 3.
Input: 1 -> 2 -> 3
Output: 1 2 3
Hint: while loop.
Solution: while(head!=null) { print(head.data); head=head.next; }
