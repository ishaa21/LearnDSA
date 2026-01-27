# Postfix to Prefix

## What is this?
Converting Postfix (A B +) to Prefix (+ A B).

## Why do we need it?
- Expression manipulation compilers

## Algorithm Logic
1. Scan left to right
2. Operands -> Push
3. Operator -> Pop 2, Combine as (Operator + Op2 + Op1), Push

## Common Mistakes
- String concatenation order

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Data transformation

## Key Takeaways
- Stack simplifies transformation
- One pass algorithm

## Recommended Problems
- Postfix to Prefix (GFG)

## Mini Practice
### Problem: Convert
Convert AB+C* to prefix.
Input: AB+C*
Output: *+ABC
Hint: Stack: A, B -> +AB. C -> *+ABC.
Solution: Combine strings in stack using operator as prefix.
