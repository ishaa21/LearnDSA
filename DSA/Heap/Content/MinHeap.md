# MinHeap

## What is this?
A binary tree where parent node is always <= children.

## Why do we need it?
Efficiently finding the minimum element.
Core to Dijkstra (shortest path).

## Algorithm Logic
Root is the smallest element.
Insert: Add at end, swim up ("heapifyUp").
Extract-Min: Replace root with last, sink down ("heapifyDown").

## Common Mistakes
Assuming left < right. Heap only guarantees parent < children.

## Time Complexity
Insert: O(log n)
Extract-Min: O(log n)
Peek: O(1)

## Space Complexity
O(n)

## Real Life Use
Managing timers/events.
Huffman Coding (files compression).

## Key Takeaways
- Root is min
- Complete Binary Tree

## Recommended Problems
- LeetCode: Merge k Sorted Lists

## Mini Practice
### Problem
Input: [10, 20, 5] insert one by one
Output: [5, 20, 10]
Hint: Insert 10. Insert 20. Insert 5 -> swap(5,10).
Solution: Root is 5.
