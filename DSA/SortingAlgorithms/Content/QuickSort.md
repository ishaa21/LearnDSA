# Quick Sort

## What is this?
Quick Sort picks a pivot and partitions array around it (smaller to left, larger to right).

## Why do we need it?
- Very fast in practice (Cache friendly)
- In-place (No extra array needed)

## Algorithm Logic
- Choose pivot
- Partition elements
- Recursively sort partitions

## Common Mistakes
- Bad pivot choice (Worst case O(n²))
- Infinite recursion

## Time Complexity
- Average: O(n log n)
- Worst: O(n²)

## Space Complexity
O(log n) (Stack space)

## Real Life Use
- standard library sort functions (Arrays.sort, std::sort)

## Key Takeaways
- Fast but unstable
- Pivot choice matters

## Recommended Problems
- Sort an Array (LeetCode)
- Quick Sort (GFG)

## Mini Practice
### Problem: Partition
Partition [5, 1, 4, 2, 8] around pivot 4.
Input: Array, Pivot 4
Output: [1, 2] 4 [5, 8]
Hint: Swap elements < 4 to left.
Solution: Two pointer swap logic.
