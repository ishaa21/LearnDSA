# Prefix to Postfix

## What is this?
Converting Prefix (+ A B) to Postfix (A B +).

## Why do we need it?
- Standardizing formats

## Algorithm Logic
1. Scan Right to Left
2. Operands -> Push
3. Operator -> Pop 2, Combine (Op1 + Op2 + Operator), Push

## Common Mistakes
- Wrong string order

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Compiler optimization phases

## Key Takeaways
- Stack holds partial expressions
- Single pass

## Mini Practice
### Problem: Convert
Convert *+ABC to Postfix.
Input: *+ABC
Output: AB+C*
Hint: C, B, A. + -> AB+. * -> AB+C*.
Solution: Scan right to left. Combine strings with operator at end.
