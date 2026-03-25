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

### Problem: 4 Queens Solution
Place 4 queens on a 4x4 board such that no two attack each other.
Input: N = 4
Output: Solution exists. One arrangement: [2,4,1,3] (queen positions per row)
Hint: Try placing queen in each column of current row. If safe, recurse for next row.
Solution: Row1:col2, Row2:col4, Row3:col1, Row4:col3. Verify no conflicts.

### Problem: Count Solutions
How many solutions exist for the 8-Queens problem?
Input: N = 8
Output: 92 solutions
Hint: Use backtracking to enumerate all valid configurations.
Solution: Systematically try all placements, backtrack on conflicts. Total = 92.
