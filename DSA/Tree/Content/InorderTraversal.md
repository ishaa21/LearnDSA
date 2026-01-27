# Inorder Traversal

## What is this?
Left → Root → Right traversal.

## Why do we need it?
- Gives **sorted** order in BST.

## Algorithm Logic
1. Visit Left
2. Visit Root
3. Visit Right

## Common Mistakes
- Wrong traversal order

## Time Complexity
O(n)

## Space Complexity
O(h)

## Real Life Use
- Getting sorted data from BST

## Key Takeaways
- Sorted output in BST
- Recursive is natural choice

## Recommended Problems
- Binary Tree Inorder Traversal (LeetCode)

## Mini Practice
### Problem: Get Sorted
Print inorder of [2, 1, 3] (BST).
Input: 1 <- 2 -> 3
Output: 1, 2, 3
Hint: Left (1), Root (2), Right (3).
Solution: inorder(root.left); print(root); inorder(root.right);
