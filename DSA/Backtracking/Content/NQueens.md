# NQueens

## What is this?
Place N queens on NxN board, no two attacking.

## Why do we need it?
Example of constraint satisfaction problems (CSPs).
Classic backtracking benchmark.

## Algorithm Logic
Place queen col by col (or row by row).
IsSafe? Check row, diag1, diag2.
If success, recurse for next col.

## Common Mistakes
Unnecessary checks (don't check all board, just backwards).

## Time Complexity
Exponential (approx O(N!))

## Space Complexity
O(n^2) or O(n) (optimized)

## Real Life Use
Constraint solving (sudoku, timetables).

## Key Takeaways
- Constraint-based backtracking
- Diagonals can be checked fast with arrays

## Recommended Problems
- LeetCode: N-Queens

## Mini Practice
### Problem
Input: N=4
Output:
. Q . .
. . . Q
Q . . .
. . Q .
(One of 2 solutions)
Hint: Try (0,1), (1,3), (2,0), (3,2).
Solution: 2 solutions found.
