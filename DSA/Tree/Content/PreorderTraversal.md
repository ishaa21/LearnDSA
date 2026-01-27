# Preorder Traversal

## What is this?
Root → Left → Right traversal.

## Why do we need it?
- Used to copy tree.
- Used to serialize tree.

## Algorithm Logic
1. Visit Root
2. Visit Left
3. Visit Right

## Common Mistakes
- Skipping root

## Time Complexity
O(n)

## Space Complexity
O(h)

## Real Life Use
- Expression tree prefix notation

## Key Takeaways
- Root comes first
- Useful for saving tree structure

## Recommended Problems
- Binary Tree Preorder Traversal (LeetCode)

## Mini Practice
### Problem: Print Preorder
Print preorder of 1 -> (2, 3).
Input: 1 -> (2, 3)
Output: 1, 2, 3
Hint: Root (1), Left (2), Right (3).
Solution: print(root); pre(left); pre(right);
