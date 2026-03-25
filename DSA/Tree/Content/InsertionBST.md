# Insertion in BST

## What is this?
Adding a new node in BST while maintaining order.

## Why do we need it?
- To grow BST while keeping order.

## Algorithm Logic
1. Compare with root
2. Go left if smaller, right if larger
3. Insert at leaf when null reached

## Common Mistakes
- Inserting at wrong position
- Modifying structure unnecessarily

## Time Complexity
Average: O(log n)

## Space Complexity
O(h) (Height of tree)

## Real Life Use
- Dynamic Set maintenance

## Key Takeaways
- Recursive or iterative
- Always inserted as a leaf

## Mini Practice
### Problem: Insert 5
Insert 5 into 10 -> 2.
Input: Root: 10, Left: 2. Insert 5.
Output: 10 -> 2 -> 5 (Right of 2)
Hint: 5 < 10 (go left). 5 > 2 (go right of 2).
Solution: root.left.right = new Node(5);
