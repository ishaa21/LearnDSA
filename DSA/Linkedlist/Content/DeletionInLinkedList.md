# Deletion in Linked List

## What is this?
Removing a node from the list.

## Why do we need it?
- To delete unwanted data.

## Algorithm Logic
- Find node
- Change previous node's `next` to skip the target node

## Common Mistakes
- Memory leak
- Skipping node
- Null pointer when list empty

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Removing item from cart
- Closing a tab

## Key Takeaways
- Careful pointer handling
- Handle head/tail cases

## Mini Practice
### Problem: Delete Head
Delete head of 10 -> 20 -> 30.
Input: 10 -> 20 -> 30
Output: 20 -> 30
Hint: head = head.next
Solution: head = head.next; (Check if head was null first)

### Problem: Delete Tail
Delete the last node from: 10 -> 20 -> 30 -> 40.
Input: 10->20->30->40
Output: 10->20->30
Hint: Traverse to second-last node, set its next to null.
Solution: curr=head; while curr.next.next: curr=curr.next; curr.next = null

### Problem: Delete by Value
Delete node with value 20 from: 10 -> 20 -> 30.
Input: 10->20->30, delete value 20
Output: 10->30
Hint: Find the node before the target, bypass the target node.
Solution: prev=head; while prev.next.data!=20: prev=prev.next; prev.next = prev.next.next
