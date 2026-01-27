# Binary Tree

## What is this?
A binary tree is a tree where each node has at most two children.

## Why do we need it?
- Foundation for advanced trees (BST, AVL, Red-Black)
- Easy to traverse

## Algorithm Logic
Each node → left child + right child

## Common Mistakes
- Assuming it is always sorted (It is NOT sorted by default)

## Time Complexity
Traversal: O(n)

## Space Complexity
O(n)

## Real Life Use
- DOM (Document Object Model) in HTML
- Expression Trees in compilers

## Key Takeaways
- No ordering guarantee
- Max 2 children per node

## Recommended Problems
- Binary Tree Inorder Traversal (LeetCode)
- Binary Tree Basics (GFG)

## Mini Practice
### Problem: Create & Print
Create a root (1) with left (2) and right (3). Print the sum.
Input: (1) -> (2, 3)
Output: Sum: 6
Hint: Node root = new Node(1); root.left = new Node(2)...
Solution: Sum = root.val + root.left.val + root.right.val;
