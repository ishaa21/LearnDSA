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

## Mini Practice
### Problem: DFS Order
Start DFS from 0 in 0-1, 1-2.
Input: 0-1-2
Output: 0, 1, 2
Hint: Visit 0, go to 1, go to 2. Backtrack.
Solution: dfs(0); -> dfs(1); -> dfs(2);

### Problem: All Paths
Find all paths from 0 to 3 in graph: 0-1, 0-2, 1-3, 2-3.
Input: Edges: 0-1, 0-2, 1-3, 2-3
Output: Path 1: 0->1->3, Path 2: 0->2->3
Hint: Use DFS with backtracking to explore all paths.
Solution: DFS from 0, track current path. On reaching 3, save path. Backtrack and explore other branches.

### Problem: Detect Back Edge
Determine if graph has a cycle using DFS: 0->1, 1->2, 2->0.
Input: Directed edges: 0->1, 1->2, 2->0
Output: Cycle detected (back edge: 2->0)
Hint: Track nodes in current recursion stack. Back edge = visiting a node already in stack.
Solution: Maintain recursion stack. If DFS visits a node already in stack, cycle exists.
