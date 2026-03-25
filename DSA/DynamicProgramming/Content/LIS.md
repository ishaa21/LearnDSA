# LIS

## What is this?
Longest Increasing Subsequence in an array (strictly increasing, can skip elements).

## Why do we need it?
Optimization problems, scheduling.

## Algorithm Logic
DP O(n^2) or Binary Search O(nlogn).
DP[i] = max(DP[j] + 1) for j < i and arr[j] < arr[i].

## Common Mistakes
Confusing subsequence with subarray.

## Time Complexity
DP: O(n²)
Optimized: O(n log n)

## Space Complexity
O(n)

## Real Life Use
Analysis of trends, optimization.

## Key Takeaways
- Order preserved
- Subproblem structure

## Mini Practice
### Problem
Input: [10,9,2,5,3,7,101,18]
Output: 4 ([2,3,7,101] or [2,3,7,18] etc)
Hint: Check increasing subsequences.
Solution: Length is 4.
