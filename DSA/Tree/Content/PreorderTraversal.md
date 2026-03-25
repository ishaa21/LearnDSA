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

## Mini Practice
### Problem: Print Preorder
Print preorder of 1 -> (2, 3).
Input: 1 -> (2, 3)
Output: 1, 2, 3
Hint: Root (1), Left (2), Right (3).
Solution: print(root); pre(left); pre(right);

### Problem: Reconstruct Tree
Given preorder [1,2,4,5,3,6,7], draw the tree.
Input: Preorder: [1,2,4,5,3,6,7]
Output: Root=1, Left subtree: 2(4,5), Right subtree: 3(6,7)
Hint: First element is always root. Need inorder to fully reconstruct.
Solution: Preorder visits Root first. So 1 is root. Need additional info (inorder) for exact tree.

### Problem: Serialize Tree
Convert tree 1(2(4,5),3) to string using preorder.
Input: Tree: 1(2(4,5),3)
Output: "1,2,4,null,null,5,null,null,3,null,null"
Hint: Visit root, then left, then right. Use "null" for empty children.
Solution: Preorder with null markers: 1->2->4->null->null->5->null->null->3->null->null
