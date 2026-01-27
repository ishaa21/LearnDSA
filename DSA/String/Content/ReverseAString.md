# Reverse a String

## What is this?
Reversing character order in a string (First becomes last).

## Why do we need it?
- Palindrome checks
- String manipulation puzzles

## Algorithm Logic
- Swap characters from both ends (Start, End)
- Move Start++, End--

## Common Mistakes
- Incorrect index handling (Off by one)
- Modifying immutable string directly (Java/Python)

## Time Complexity
O(n)

## Space Complexity
O(1) (In-place for mutable strings) / O(n) (For immutable)

## Real Life Use
- DNA Sequence reversal
- Mirroring text

## Key Takeaways
- Two-pointer technique
- Strings can be immutable

## Recommended Problems
- Reverse String (LeetCode)

## Mini Practice
### Problem: Reverse
Reverse "abc".
Input: "abc"
Output: "cba"
Hint: Swap 'a' and 'c'.
Solution: Swap logic.
