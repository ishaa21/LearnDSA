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

## Recommended Problems
- Binary Search (LeetCode)
- Search Insert Position (LeetCode)

## Mini Practice
### Problem: Find Target
Find index of 4 in [1, 2, 4, 8, 16].
Input: [1, 2, 4, 8, 16], Target 4
Output: Index 2
Hint: Mid is 4. Match!
Solution: calculate mid, compare, adjust low/high.
