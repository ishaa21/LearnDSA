# Reverse Doubly Linked List

## What is this?
Reversing doubly linked list. All `prev` become `next` and vice versa.

## Why do we need it?
- Bi-direction reversal.

## Algorithm Logic
Swap `prev` and `next` pointers for every node.

## Common Mistakes
- Incorrect pointer swap
- Not updating head

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Reversing history
- Mirroring list

## Key Takeaways
- Handle both links
- Simpler than singly (no need for 3 pointers)

## Recommended Problems
- Reverse a Doubly Linked List (GFG)

## Mini Practice
### Problem: Reverse DLL
Reverse 1 <-> 2.
Input: 1 <-> 2
Output: 2 <-> 1
Hint: Swap .prev and .next.
Solution: temp=node.prev; node.prev=node.next; node.next=temp;
