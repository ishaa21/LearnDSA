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

## Recommended Problems
- Delete Node in a Linked List (LeetCode)

## Mini Practice
### Problem: Delete Head
Delete head of 10 -> 20 -> 30.
Input: 10 -> 20 -> 30
Output: 20 -> 30
Hint: head = head.next
Solution: head = head.next; (Check if head was null first)
