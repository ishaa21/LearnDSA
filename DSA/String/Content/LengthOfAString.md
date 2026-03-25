# Length of a String

## What is this?
Finding total number of characters in a string.

## Why do we need it?
- Looping through string (Need bounds)
- Validations (Min/Max character limit)

## Algorithm Logic
Count characters until end marked (like '\0' in C) or use internal size property.

## Common Mistakes
- Including null character in count
- Wrong loop condition (< vs <=)

## Time Complexity
O(n) (If manually counting) / O(1) (If property)

## Space Complexity
O(1)

## Real Life Use
- Twitter character limit check
- Password length validation

## Key Takeaways
- Fundamental string operation
- Strings are arrays of characters

## Mini Practice
### Problem: Manual Count
Count chars in "Hello" without .length().
Input: "Hello"
Output: 5
Hint: Loop until char is null (if C) or iterate-count.
Solution: int count=0; for(char c: s) count++;
