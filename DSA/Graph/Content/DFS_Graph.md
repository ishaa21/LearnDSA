# DFS Graph

## What is this?
Depth First Search explores as deep as possible before backtracking.

## Why do we need it?
- Path finding (Maze solving)
- Cycle detection
- Topological Sorting

## Algorithm Logic
- Use **Stack** (or Recursion)
- Visit node, mark visited
- Recursively visit first unvisited neighbor

## Common Mistakes
- Stack overflow (if recursion too deep)
- Not marking visited

## Time Complexity
O(V + E)

## Space Complexity
O(V)

## Real Life Use
- Solving Sudoku/Puzzles
- Web Crawlers (Deep)

## Key Takeaways
- Uses Recursion/Stack
- Goes deep before wide

## Recommended Problems
- Flood Fill (LeetCode)
- DFS of Graph (GFG)

## Mini Practice
### Problem: DFS Order
Start DFS from 0 in 0-1, 1-2.
Input: 0-1-2
Output: 0, 1, 2
Hint: Visit 0, go to 1, go to 2. Backtrack.
Solution: dfs(0); -> dfs(1); -> dfs(2);
