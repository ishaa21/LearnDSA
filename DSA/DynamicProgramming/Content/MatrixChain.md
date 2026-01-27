# MatrixChain

## What is this?
Optimal order of matrix multiplication (parenthesization).

## Why do we need it?
Reduce computation cost.
Matrix multiplication is associative but cost varies.

## Algorithm Logic
Partition DP.
Choose split point k to minimize cost(i,k) + cost(k+1,j) + dims.

## Common Mistakes
Wrong indices or base cases.

## Time Complexity
O(n³)

## Space Complexity
O(n²)

## Real Life Use
Computer graphics, scientific computing.

## Key Takeaways
- Order matters
- Not multiplying, just finding cost

## Recommended Problems
- GFG: Matrix Chain Multiplication

## Mini Practice
### Problem
Input: Matrices [10x20], [20x30], [30x40]
Output: Min Multiplications = 10*20*30 + 10x30x40 = 6000 + 12000 = 18000
    Or (10*20)*30 is cheap?
    (AB)C vs A(BC).
    (10x20x30) + (10x30x40) = 6000 + 12000 = 18000
    10x(20x30x40) = 24000 + 10x20x40 = 8000 + 24000 = 32000.
Hint: Calculate cost for all splits.
Solution: 18000 (AB)C
