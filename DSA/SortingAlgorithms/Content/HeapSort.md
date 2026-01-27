# Heap Sort

## What is this?
Heap Sort uses Max-Heap data structure to sort elements.

## Why do we need it?
- Guaranteed performance O(n log n)
- No extra memory (In-place)

## Algorithm Logic
1. Build Max Heap
2. Swap root (Max) with end
3. Reduce heap size and Heapify
4. Repeat

## Common Mistakes
- Incorrect heapify logic
- Forgetting to reduce size

## Time Complexity
O(n log n)

## Space Complexity
O(1)

## Real Life Use
- Embedded systems (Strict memory constraints)
- Priority Queues

## Key Takeaways
- In-place sort
- Not stable

## Recommended Problems
- Sort an Array (LeetCode)
- Heap Sort (GFG)

## Mini Practice
### Problem: Max Heap
Build Max Heap from [1, 3, 2].
Input: [1, 3, 2]
Output: [3, 1, 2] (One possible heap)
Hint: Parent must be > Children.
Solution: Heapify algorithm.
