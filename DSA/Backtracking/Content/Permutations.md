# Permutations

## What is this?
Arrangements where order matters (n! for distinct items).

## Why do we need it?
Ordering problems like TSP (traveling salesman).

## Algorithm Logic
Backtracking: Swap or use visited array
For each position, try every unused element.

## Common Mistakes
Confusing with combinations (order irrelevant).

## Time Complexity
O(n!)

## Space Complexity
O(n) recursion depth.

## Real Life Use
Anagrams, sequences, password cracking.

## Key Takeaways
- Order matters
- n! grows extremely fast

## Recommended Problems
- LeetCode: Permutations

## Mini Practice
### Problem
Input: "abc"
Output: abc, acb, bac, bca, cab, cba (6 total)
Hint: Try each char at index 0, then recurse.
Solution: 6 rearrangements.
