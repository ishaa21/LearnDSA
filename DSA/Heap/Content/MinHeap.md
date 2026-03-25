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

## Mini Practice
### Problem
Input: [10, 20, 5] insert one by one
Output: [5, 20, 10]
Hint: Insert 10. Insert 20. Insert 5 -> swap(5,10).
Solution: Root is 5.

### Problem: Sort Using MinHeap
Sort [12, 11, 13, 5, 6] using a min heap.
Input: [12, 11, 13, 5, 6]
Output: [5, 6, 11, 12, 13]
Hint: Build min heap, extract min repeatedly.
Solution: Build heap: [5,6,13,12,11]. Extract: 5,6,11,12,13.

### Problem: Merge K Sorted Lists
Merge [1,4,7] and [2,5,8] and [3,6,9] using min heap.
Input: Three sorted arrays
Output: [1, 2, 3, 4, 5, 6, 7, 8, 9]
Hint: Insert first element of each list into min heap. Extract min, insert next from that list.
Solution: Heap: [1,2,3]. Extract 1, insert 4. Heap: [2,3,4]. Continue until all extracted.
