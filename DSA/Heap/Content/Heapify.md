# Heapify

## What is this?
Process of converting an array into a heap (Max or Min).

## Why do we need it?
Building a heap efficiently (faster than inserting one by one).
Heap Sort.

## Algorithm Logic
Start from last non-leaf node (index n/2 - 1).
Heapify down towards root.
Ensures subtrees are heaps recursively.

## Common Mistakes
Top-down heapify (results in O(nlogn) build time).
Bottom-up heapify gives O(n) build time.

## Time Complexity
O(n) - surprising but true (geometric series).

## Space Complexity
O(1) (in-place)

## Real Life Use
In-place sorting (Heapsort).
Initializing priority queues.

## Key Takeaways
- Faster than N insertions
- Can be done in-place

## Recommended Problems
- GFG: Build Heap

## Mini Practice
### Problem
Input: [1, 2, 3]
Target: Max Heap
Output: [3, 2, 1]
Hint: Last non-leaf is index 0 (val 1). Left child 2, right 3. 3 is max.
Solution: Swap 1 and 3. Result [3, 2, 1].
