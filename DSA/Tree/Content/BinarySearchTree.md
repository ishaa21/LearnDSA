# Binary Search Tree (BST)

## What is this?
A BST is a binary tree where left < root < right for every node.

## Why do we need it?
- Fast search (like Binary Search)
- Ordered data storage

## Algorithm Logic
- Compare value with root
- If smaller, go left
- If larger, go right

## Common Mistakes
- Ignoring duplicates
- Breaking BST property when manually linking

## Time Complexity
- Average: O(log n)
- Worst: O(n) (Skewed tree)

## Space Complexity
O(n)

## Real Life Use
- Database Indexing
- File Systems

## Key Takeaways
- Ordered tree
- Efficient searching

## Mini Practice
### Problem: Search
Search for 10 in BST.
Input: BST includes 10.
Output: Found
Hint: if (val < root.val) search(root.left) else search(root.right).
Solution: Return node if found, else null.
