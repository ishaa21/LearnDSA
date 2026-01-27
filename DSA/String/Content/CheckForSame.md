# Check For Same

## What is this?
Checking if two strings are identical in content.

## Why do we need it?
- Password validation
- Command processing

## Algorithm Logic
1. Compare lengths (If diff, False)
2. Compare each character

## Common Mistakes
- Using `==` instead of `.equals()` (Reference check vs Value check)
- Ignoring case

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Login systems
- Diff tools

## Key Takeaways
- Character-wise comparison
- Comparison stops at first mismatch

## Recommended Problems
- Valid Anagram (LeetCode)

## Mini Practice
### Problem: Equal?
"abc" vs "abd".
Input: "abc", "abd"
Output: False
Hint: 'c' != 'd'.
Solution: Loop comparison.
