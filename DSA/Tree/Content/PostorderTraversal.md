# Postorder Traversal

## What is this?
Left → Right → Root traversal.

## Why do we need it?
- Used to delete tree (delete children before parent).

## Algorithm Logic
1. Visit Left
2. Visit Right
3. Visit Root

## Common Mistakes
- Wrong recursion order

## Time Complexity
O(n)

## Space Complexity
O(h)

## Real Life Use
- Directory size calculation (Folder size = sum of subfolders)

## Key Takeaways
- Root comes last
- Bottom-up processing

## Recommended Problems
- Binary Tree Postorder Traversal (LeetCode)

## Mini Practice
### Problem: Print Postorder
Print postorder of 1 -> (2, 3).
Input: 1 -> (2, 3)
Output: 2, 3, 1
Hint: Left (2), Right (3), Root (1).
Solution: post(left); post(right); print(root);
