# Prefix to Infix

## What is this?
Converting Prefix (+ A B) to Infix (A + B).

## Why do we need it?
- Human readability

## Algorithm Logic
1. Scan Right to Left
2. Operands -> Push
3. Operator -> Pop 2, Combine (Op1 + Operator + Op2), Push

## Common Mistakes
- Wrong scan direction

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Text editors

## Key Takeaways
- Use stack for operands
- Reverse scan makes it easier

## Recommended Problems
- Prefix to Infix Conversion (GFG)

## Mini Practice
### Problem: Convert
Convert *+ABC to Infix.
Input: *+ABC
Output: ((A+B)*C)
Hint: C, B, A. + -> (A+B). * -> ((A+B)*C).
Solution: Scan right to left. Combine strings.
