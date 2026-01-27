# Infix to Prefix

## What is this?
Convert infix (A + B) to prefix (+ A B).

## Why do we need it?
- Efficient evaluation
- Alternative to Postfix

## Algorithm Logic
1. Reverse infix
2. Convert to Postfix (Swap '(' and ')')
3. Reverse result

## Common Mistakes
- Forgetting to reverse initial string
- Bracket swapping

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Syntax analysis

## Key Takeaways
- Operator comes first
- Logic similar to Postfix

## Recommended Problems
- Infix to Prefix Conversion (GFG)

## Mini Practice
### Problem: Convert
Convert (A + B) * C to prefix.
Input: (A + B) * C
Output: * + A B C
Hint: Reverse: C * ) B + A (. Postfix: C B A + *. Reverse: * + A B C.
Solution: Reverse, Postfix logic, Reverse back.
