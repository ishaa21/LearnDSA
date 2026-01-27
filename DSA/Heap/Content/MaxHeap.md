# MaxHeap

## What is this?
A binary tree where parent node is always >= children.

## Why do we need it?
Efficiently finding the maximum element (Priority Queue).

## Algorithm Logic
Root is the largest element.
Insert: Add at end, swim up ("heapifyUp").
Extract-Max: Replace root with last, sink down ("heapifyDown").

## Common Mistakes
Confusing with BST (where left < root < right).
In a heap, only vertical constraint matters.

## Time Complexity
Insert: O(log n)
Extract-Max: O(log n)
Peek: O(1)

## Space Complexity
O(n) (array)

## Real Life Use
Task scheduling (urgent tasks first).
Dijkstra's & Prim's Algorithm.

## Key Takeaways
- Root is max
- Complete Binary Tree

## Recommended Problems
- LeetCode: Kth Largest Element in an Array (using MaxHeap)

## Mini Practice
### Problem
Input: [10, 20, 15] insert one by one
Output: [20, 10, 15]
Hint: Insert 10. Insert 20 -> swap(10,20). Insert 15 -> 15 < 20 ok.
Solution: Root is 20.
