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

## Mini Practice
### Problem: Merge
Merge [1, 3] and [2, 4].
Input: Two sorted arrays
Output: [1, 2, 3, 4]
Hint: Compare heads. Pick smaller.
Solution: Two pointer approach.

### Problem: Merge Two Sorted
Merge [1, 3, 5] and [2, 4, 6] into one sorted array.
Input: [1, 3, 5] and [2, 4, 6]
Output: [1, 2, 3, 4, 5, 6]
Hint: Use two pointers, compare elements, pick smaller.
Solution: i=0,j=0. Compare arr1[i] and arr2[j]. Pick smaller. Move that pointer.

### Problem: Trace Merge Sort
Trace the merge sort steps for [38, 27, 43, 3].
Input: [38, 27, 43, 3]
Output: Split: [38,27] [43,3] -> [38][27][43][3] -> Merge: [27,38][3,43] -> [3,27,38,43]
Hint: Keep splitting until single elements, then merge back.
Solution: Divide until size 1, then merge pairs in sorted order.
