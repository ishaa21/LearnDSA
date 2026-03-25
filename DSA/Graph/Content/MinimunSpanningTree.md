# Minimum Spanning Tree (MST)

## What is this?
A subset of edges that connects all vertices with minimum total weight and NO cycles.

## Why do we need it?
- Network design (Cable laying)
- Road construction cost optimization

## Algorithm Logic
1. **Kruskal’s**: Sort edges loop. Add if no cycle (Union-Find).
2. **Prim’s**: Grow tree from source using Priority Queue.

## Common Mistakes
- Disconnected graph handling
- Forgetting to sort edges in Kruskal's

## Time Complexity
O(E log V)

## Space Complexity
O(V)

## Real Life Use
- Power Grid distribution
- LAN wiring

## Key Takeaways
- No cycles
- Connects all vertices
- Minimizes total cost

## Mini Practice
### Problem: MST Cost
Edges: (0-1, wt 1), (1-2, wt 2), (0-2, wt 5).
Input: Triangle with weights 1, 2, 5.
Output: Cost 3 (Edges 1 + 2)
Hint: Don't pick edge with wt 5 (it forms cycle with higher cost).
Solution: Sort edges. Pick smallest safe edges.
