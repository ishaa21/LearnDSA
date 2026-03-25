# Insert A Character

## What is this?
Adding a character at a specific position inside a string.

## Why do we need it?
- Formatting (Adding dashes to phone num)
- Text editing

## Algorithm Logic
1. Shift characters to right from index
2. Place new char

## Common Mistakes
- Invalid index (OutOfBounds)
- Forgetting strings are immutable (creating new logic)

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Auto-complete suggestion
- Masking sensitive data

## Key Takeaways
- Strings are immutable in many languages (New object created)
- Shifting needed

## Mini Practice
### Problem: Insert
Insert '-' in "1234" at index 2.
Input: "1234", '-', 2
Output: "12-34"
Hint: Substring(0,2) + '-' + Substring(2).
Solution: String manipulation.
