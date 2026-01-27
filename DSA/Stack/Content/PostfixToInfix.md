# Postfix to Infix

## What is this?
Converting Postfix (A B +) back to human-readable Infix (A + B).

## Why do we need it?
- Displaying results to users
- Code decompilation

## Algorithm Logic
1. Read left to right
2. Operands -> Stack
3. Operator -> Pop 2, Combine with operator in middle, Push result

## Common Mistakes
- Wrong operand order (Op2 + Op1)

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Spreadsheets correcting formulas

## Key Takeaways
- Stack simplifies expression handling
- Adds parentheses back

## Recommended Problems
- Expression Conversion Problems (GFG)

## Mini Practice
### Problem: Convert
Convert AB+C* to Infix.
Input: AB+C*
Output: ((A+B)*C)
Hint: Push A, B. Pop -> (A+B). Push C. Pop -> ((A+B)*C).
Solution: Stack builds string fragments.
