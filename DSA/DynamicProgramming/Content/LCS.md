# LCS

## What is this?
Longest Common Subsequence of two strings (not necessarily contiguous).

## Why do we need it?
Version control (diff tools).
DNA matching.

## Algorithm Logic
Compare characters; if match, 1 + LCS(rest); else max(LCS(skip1), LCS(skip2)).

## Common Mistakes
Confusing with Longest Common Substring (contiguous).

## Time Complexity
O(nm)

## Space Complexity
O(nm)

## Real Life Use
Diff algorithms, bioinformatics.

## Key Takeaways
- Order matters
- Dynamic programming on 2D table

## Mini Practice
### Problem
Input: "abcde", "ace"
Output: 3 ("ace")
Hint: DP table with dimensions (n+1)x(m+1).
Solution: LCS length is 3.
