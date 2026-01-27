# Merge Sort

## What is this?
Merge Sort divides array into halves, sorts them recursively, and merges them in sorted order.

## Why do we need it?
- Fast and reliable (Always O(n log n))
- Used in large data sorting
- Stable sort

## Algorithm Logic
1. Divide array (Mid)
2. Sort left and right halves
3. Merge sorted halves

## Common Mistakes
- Incorrect merge logic (Index out of bounds)
- Forgetting base case

## Time Complexity
O(n log n)

## Space Complexity
O(n) (Requires extra array)

## Real Life Use
- Sorting Linked Lists
- E-commerce product sorting

## Key Takeaways
- Divide and conquer
- Stable and efficient

## Recommended Problems
- Sort an Array (LeetCode)
- Merge Sort (GFG)

## Mini Practice
### Problem: Merge
Merge [1, 3] and [2, 4].
Input: Two sorted arrays
Output: [1, 2, 3, 4]
Hint: Compare heads. Pick smaller.
Solution: Two pointer approach.
