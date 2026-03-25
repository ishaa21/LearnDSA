# Search a Character

## What is this?
Finding a character in string (Does it exist? Where?).

## Why do we need it?
- Validation (Contains @?)
- Text processing

## Algorithm Logic
Linear Scan (Check one by one)

## Common Mistakes
- Case mismatch (A vs a)
- Returning after first match vs finding all

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Find feature (Ctrl + F)
- Spam keyword detection

## Key Takeaways
- Simple linear search
- Case sensitivity matters

## Mini Practice
### Problem: Find Index
Find index of 'b' in "abc".
Input: "abc", 'b'
Output: 1
Hint: Loop and Check.
Solution: if(s[i] == 'b') return i;
