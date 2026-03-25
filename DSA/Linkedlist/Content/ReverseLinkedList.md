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

## Mini Practice
### Problem: Reverse
Reverse 1 -> 2 -> 3.
Input: 1 -> 2 -> 3
Output: 3 -> 2 -> 1
Hint: prev=null, curr=head. loop.
Solution: next=curr.next; curr.next=prev; prev=curr; curr=next;

### Problem: Reverse Using Stack
Reverse 1->2->3 using a stack.
Input: 1->2->3
Output: 3->2->1
Hint: Push all elements to stack, then pop to create new list.
Solution: Push 1,2,3. Pop: 3,2,1. Create new linked list.

### Problem: Check Palindrome
Check if linked list 1->2->1 is a palindrome using reverse.
Input: 1->2->1
Output: Yes, palindrome
Hint: Reverse the second half and compare with first half.
Solution: Find middle, reverse second half, compare element by element.
