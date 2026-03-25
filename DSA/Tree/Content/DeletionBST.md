# Deletion in BST

## What is this?
Removing a node from BST while maintaining order.

## Why do we need it?
- To update tree structure.

## Algorithm Logic
- Case 1: No child (Leaf) -> Just remove.
- Case 2: One child -> Replace with child.
- Case 3: Two children -> Replace with Inorder Successor (Smallest in right subtree).

## Common Mistakes
- Forgetting inorder successor logic for Case 3

## Time Complexity
O(log n) average

## Space Complexity
O(h)

## Real Life Use
- Removing user from database index

## Key Takeaways
- Most complex BST operation
- 3 specific cases

## Mini Practice
### Problem: Delete Leaf
Delete 20 from 10 -> 20.
Input: 10 -> 20. Delete 20.
Output: 10 -> null
Hint: 20 is a leaf. Just nullify parent's pointer.
Solution: root.right = null;
