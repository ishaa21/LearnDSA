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

## Mini Practice
### Problem
Input: [10, 20, 15] insert one by one
Output: [20, 10, 15]
Hint: Insert 10. Insert 20 -> swap(10,20). Insert 15 -> 15 < 20 ok.
Solution: Root is 20.

### Problem: Extract Max Twice
From MaxHeap [50, 30, 40, 10, 20], extract max twice.
Input: MaxHeap = [50, 30, 40, 10, 20]
Output: First extract: 50, Heap becomes [40, 30, 20, 10]. Second extract: 40.
Hint: Remove root, replace with last element, heapify down.
Solution: Extract 50, move 20 to root [20,30,40,10], heapify: [40,30,20,10]. Extract 40.

### Problem: Kth Largest Element
Find 3rd largest in [3, 2, 1, 5, 6, 4] using max heap.
Input: [3, 2, 1, 5, 6, 4], k=3
Output: 4
Hint: Build max heap, extract max k times.
Solution: Build heap: [6,5,4,2,3,1]. Extract 6, then 5, then 4. Answer = 4.
