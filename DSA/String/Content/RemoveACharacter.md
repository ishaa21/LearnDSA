# Remove A Character

## What is this?
Removing a character from a string.

## Why do we need it?
- Cleaning text (Removing punctuation)
- Backspace logic

## Algorithm Logic
- Create new string skipping the target index

## Common Mistakes
- Removing wrong occurrence
- Index mismatch

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Sanitizing inputs
- Trimming whitespace

## Key Takeaways
- New string is created usually
- Requires copying

## Mini Practice
### Problem: Delete
Remove 'b' from "abc".
Input: "abc", 1
Output: "ac"
Hint: Substring(0,1) + Substring(2).
Solution: Skip char at index.
