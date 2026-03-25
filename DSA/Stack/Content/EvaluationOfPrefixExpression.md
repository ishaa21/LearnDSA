# Evaluation of Prefix Expression

## What is this?
Prefix expression evaluation (Operator before operands, e.g., + 2 3).

## Why do we need it?
- Used in compilers
- LISP programming language style

## Algorithm Logic
1. Scan from right to left
2. Use stack for operands
3. On operator, pop two, calculate, push result

## Common Mistakes
- Wrong scanning direction (Must be Right to Left)

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Parsing syntax trees

## Key Takeaways
- Operator before operands
- Scan Right to Left

## Mini Practice
### Problem: Eval Prefix
Evaluate prefix: + 9 * 2 6
Input: + 9 * 2 6
Output: 21
Hint: Right to left: 6, 2, *. 2*6=12. Stack: [12]. 9. Stack: [12, 9]. +. 9+12=21.
Solution: Scan reversed. Same logic as postfix.
