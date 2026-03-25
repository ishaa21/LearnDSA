# Combinations

## What is this?
Selecting k items from n without order.

## Why do we need it?
Selection problems (lottery, teams).
Formula: C(n, k) = n! / (k!(n-k)!).

## Algorithm Logic
Backtracking: Include element or Exclude element.
Maintain a current list.

## Common Mistakes
Counting same set twice (e.g. {1,2} and {2,1} are same).

## Time Complexity
O(2^n) roughly (C(n,k) calls)

## Space Complexity
O(n) recursion depth.

## Real Life Use
Analysis of choices, probability.

## Key Takeaways
- Order doesn't matter
- No duplicates typically

## Mini Practice
### Problem
Input: [1,2,3], k=2
Output: [[1,2], [1,3], [2,3]]
Hint: Either pick i-th element or don't.
Solution: 3 combinations.
