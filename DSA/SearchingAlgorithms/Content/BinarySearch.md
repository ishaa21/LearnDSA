# Binary Search

## What is this?
Binary Search repeatedly divides sorted search space into halves to locate a target.

## Why do we need it?
- search very fast (O(log n))
- Used in large datasets

## Algorithm Logic
1. Array must be sorted
2. Compare Target with Middle
3. If matches, return
4. If Target < Middle, discard right half
5. If Target > Middle, discard left half

## Common Mistakes
- Using on unsorted array (Result undefined)
- Infinite loop due to wrong mid calculation or bounds

## Time Complexity
O(log n)

## Space Complexity
O(1)

## Real Life Use
- Dictionary lookup (Word starts with M -> open middle)
- Debugging (Binary search commits to find bug)

## Key Takeaways
- Extremely fast
- Requires sorted data

## Mini Practice
### Problem: Find Target
Find index of 4 in [1, 2, 4, 8, 16].
Input: [1, 2, 4, 8, 16], Target 4
Output: Index 2
Hint: Mid is 4. Match!
Solution: calculate mid, compare, adjust low/high.

### Problem: First Occurrence
Find the first occurrence of 5 in [2, 5, 5, 5, 8, 10].
Input: [2, 5, 5, 5, 8, 10], target=5
Output: Index 1
Hint: When you find target, don't stop. Save result and search left half.
Solution: On finding target: result=mid, high=mid-1 (keep searching left).

### Problem: Search in Rotated Array
Find 3 in rotated sorted array [4, 5, 6, 7, 0, 1, 2, 3].
Input: [4, 5, 6, 7, 0, 1, 2, 3], target=3
Output: Index 7
Hint: Determine which half is sorted, then decide which half to search.
Solution: Check if left half sorted. If target in left range, search left. Else search right.
