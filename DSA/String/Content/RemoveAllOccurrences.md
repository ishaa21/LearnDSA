# Remove All Occurrences

## What is this?
Removing all instances of a character or substring.

## Why do we need it?
- Text normalization (Remove all spaces)
- Word censorship

## Algorithm Logic
- Traverse string
- Append only characters NOT matching target

## Common Mistakes
- Partial match handling
- Infinite loop (if recursively replacing)

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Profanity filter
- Syntax cleaning

## Key Takeaways
- Clean string operations
- Often uses StringBuilder

## Mini Practice
### Problem: Remove All
Remove all 'l' from "Hello".
Input: "Hello"
Output: "Heo"
Hint: Loop, if(c != 'l') append.
Solution: Filter logic.
