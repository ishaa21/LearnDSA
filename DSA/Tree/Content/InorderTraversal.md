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

## Mini Practice
### Problem: Get Sorted
Print inorder of [2, 1, 3] (BST).
Input: 1 <- 2 -> 3
Output: 1, 2, 3
Hint: Left (1), Root (2), Right (3).
Solution: inorder(root.left); print(root); inorder(root.right);

### Problem: Build Sorted Array
Given BST with root=4, left=2(left=1,right=3), right=6(left=5,right=7). Get sorted array.
Input: BST: 4(2(1,3), 6(5,7))
Output: [1, 2, 3, 4, 5, 6, 7]
Hint: Inorder traversal of BST always gives sorted output.
Solution: Inorder: Left(1,2,3) -> Root(4) -> Right(5,6,7) = [1,2,3,4,5,6,7]

### Problem: Kth Smallest
Find 3rd smallest element in BST: 5(3(2,4), 7(6,8)).
Input: BST as above, k=3
Output: 4
Hint: Do inorder traversal, count nodes visited, stop at k.
Solution: Inorder: 2,3,4... 3rd element = 4.
