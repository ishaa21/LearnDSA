# Insertion in Linked List

## What is this?
Adding a new node to the list.

## Why do we need it?
- To grow list dynamically.

## Algorithm Logic
1. Create new node
2. Update next pointers
3. If inserting at head, update head

## Common Mistakes
- Wrong pointer linking (Losing the rest of the list)

## Time Complexity
- At head: O(1)
- At position: O(n)

## Space Complexity
O(1)

## Real Life Use
- Adding a new train car
- Adding items to checklist

## Key Takeaways
- Pointer updates are crucial
- Order of update matters

## Recommended Problems
- Insert into a Linked List (LeetCode)

## Mini Practice
### Problem: Insert at Head
Insert 5 at head of 10 -> 20.
Input: List: 10 -> 20. Val: 5.
Output: 5 -> 10 -> 20.
Hint: NewNode.next = head; head = NewNode.
Solution: node.next = head; head = node;
