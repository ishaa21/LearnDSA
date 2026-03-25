# Diameter of a Tree

## What is this?
Diameter is the longest path between **any** two nodes in a tree.

## Why do we need it?
- Measure tree width/spread.

## Algorithm Logic
For every node, calculate `Left Height + Right Height`.
Diameter = Max of this value across all nodes.

## Common Mistakes
- Confusing diameter with height
- Assuming diameter must pass through root (It might not!)

## Time Complexity
O(n)

## Space Complexity
O(h)

## Real Life Use
- Network delay diameter (max hops between nodes)

## Key Takeaways
- Path may not pass root
- Related to height

## Mini Practice
### Problem: Diameter
Find diameter. Root(1) -> Left(2).
Input: 1 -> 2
Output: 1 (Edge between 1 and 2)
Hint: Height(2) = 0. Height(right) = 0. Path = 1.
Solution: Update max diameter during height calculation.
