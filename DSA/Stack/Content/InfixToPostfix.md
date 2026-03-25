# Infix to Postfix

## What is this?
Convert infix expression (A + B) to postfix (A B +).

## Why do we need it?
- Postfix is easier for machines to evaluate
- Removes need for parentheses

## Algorithm Logic
- Use operator precedence
- Operands -> Output
- Operators -> Stack (Pop higher precedence first)

## Common Mistakes
- Ignoring precedence rules
- Left/Right associativity

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Compilers parsing math
- Expression evaluation engines

## Key Takeaways
- Removes parentheses
- Standardizes order

## Mini Practice
### Problem: Convert
Convert A + B * C
Input: A + B * C
Output: A B C * +
Hint: '*' has higher precedence than '+'.
Solution: A, B, C, *, +.
