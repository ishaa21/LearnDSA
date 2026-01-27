# Reverse Linked List

## What is this?
Reversing the direction of links. Head becomes tail, tail becomes head.

## Why do we need it?
- Reverse data order
- Interview favorite

## Algorithm Logic
Use 3 pointers: `prev`, `curr`, `next`.
1. Save next
2. Reverse link
3. Move ahead

## Common Mistakes
- Losing next reference
- Returning wrong head

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Undo simple actions
- Reversing route

## Key Takeaways
- Pointer manipulation magic
- Standard interview question

## Recommended Problems
- Reverse Linked List (LeetCode)

## Mini Practice
### Problem: Reverse
Reverse 1 -> 2 -> 3.
Input: 1 -> 2 -> 3
Output: 3 -> 2 -> 1
Hint: prev=null, curr=head. loop.
Solution: next=curr.next; curr.next=prev; prev=curr; curr=next;
