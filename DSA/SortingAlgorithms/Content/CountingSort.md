# Counting Sort

## What is this?
Counting Sort counts frequency of elements and rebuilds sorted array.

## Why do we need it?
- Very fast for small range values (Integers)
- O(n) linear time

## Algorithm Logic
1. Count frequencies in auxiliary array
2. Accumulate counts
3. Place elements

## Common Mistakes
- Using for large ranges (Memory overflow)
- Not handling negatives

## Time Complexity
O(n + k)

## Space Complexity
O(k)

## Real Life Use
- Sorting grades (0-100)
- Sorting characters in string

## Key Takeaways
- Non-comparison sort
- Range-dependent speed

## Recommended Problems
- Counting Sort (GFG)

## Mini Practice
### Problem: Count
Sort [1, 0, 1] using counts.
Input: [1, 0, 1]
Output: [0, 1, 1]
Hint: Count 0s: 1. Count 1s: 2.
Solution: Reconstruct array from counts.
