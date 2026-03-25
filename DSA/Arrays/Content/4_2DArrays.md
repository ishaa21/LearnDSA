# 2D Arrays

## What is this?
A 2D array stores data in rows and columns (like a table).

## Why do we need it?
- To represent matrices
- Useful in grids, games, images

## Algorithm Logic
Nested loops (row × column)

## Common Mistakes
- Confusing rows and columns
- Wrong loop order

## Time Complexity
Traversal: O(rows × columns)

## Space Complexity
O(rows × columns)

## Real Life Use
- Chessboard
- Spreadsheets (Excel)
- Image Processing

## Key Takeaways
- Table-like structure
- Requires nested loops

## Mini Practice
### Problem: Matrix Operations
Print a 2D matrix and find sum of all elements.
Input: [[1, 2], [3, 4]]
Output: Sum: 10
Hint: Use nested loops. Outer loop for rows, inner loop for columns.
Solution: int sum = 0; for(row) for(col) sum += mat[row][col].

### Problem: Row Sum
Find the sum of each row in a 2D array.
Input: [[1,2],[3,4],[5,6]]
Output: [3, 7, 11]
Hint: Loop through each row and sum its elements.
Solution: for row in matrix: print(sum(row))

### Problem: Transpose
Find the transpose of a 2x3 matrix.
Input: [[1,2,3],[4,5,6]]
Output: [[1,4],[2,5],[3,6]]
Hint: Swap rows and columns. New[j][i] = Old[i][j].
Solution: transpose = [[matrix[i][j] for i in range(rows)] for j in range(cols)]
