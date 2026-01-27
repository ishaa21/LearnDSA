# Generate All Substrings

## What is this?
Creating all possible substrings (Sequence of contiguous characters).

## Why do we need it?
- Pattern problems
- Brute force string checks

## Algorithm Logic
- Two nested loops: Start 0->N, End Start->N
- Extract substring(start, end)

## Common Mistakes
- Missing substrings
- Off-by-one errors in indices

## Time Complexity
O(n²) (To just iterate) / O(n³) (To print all)

## Space Complexity
O(n²) (If storing all)

## Real Life Use
- Text Analytics (N-grams)
- DNA sub-sequence analysis

## Key Takeaways
- Many substrings possible (N*(N+1)/2)
- Heavy operation

## Recommended Problems
- Palindromic Substrings (LeetCode)

## Mini Practice
### Problem: Substrings
Print all substrings of "ab".
Input: "ab"
Output: "a", "ab", "b"
Hint: Loops.
Solution: Nested loop iteration.
