# Height of Tree

## What is this?
Height is the longest path from root to leaf (number of edges).

## Why do we need it?
- Performance analysis (AVL/Red-Black trees rely on height).
- Balance checking.

## Algorithm Logic
`Max(height(left), height(right)) + 1`

## Common Mistakes
- Confusing height (edges) with depth (nodes)
- Base case return 0 vs -1

## Time Complexity
O(n)

## Space Complexity
O(h)

## Real Life Use
- Analyzing recursion depth

## Key Takeaways
- Recursive calculation
- Base case is crucial

## Mini Practice
### Problem: Height
Find height of 1 -> (2, 3).
Input: 1 -> (2, 3)
Output: 1 (if edges) or 2 (if nodes)
Hint: Max(H(2), H(3)) + 1.
Solution: return Math.max(leftH, rightH) + 1;
