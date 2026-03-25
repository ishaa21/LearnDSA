# Evaluation of Postfix Expression

## What is this?
Evaluating expressions where operator comes after operands (e.g., 2 3 +).

## Why do we need it?
- Simple evaluation using stack
- No parenthesis ambiguity

## Algorithm Logic
1. Read left to right
2. Push operands
3. Pop two operands on operator
4. Apply operation
5. Push result

## Common Mistakes
- Wrong operand order (Pop 2nd then 1st)

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- Pocket calculators
- Forth programming language

## Key Takeaways
- No parentheses needed
- Efficient for computers

## Mini Practice
### Problem: Evaluate
Evaluate postfix: 2 3 * 5 4 * + 9 -
Input: 2 3 * 5 4 * + 9 -
Output: 17
Hint: (2*3) + (5*4) - 9 = 6 + 20 - 9 = 17.
Solution: Stack: [6] -> [6, 20] -> [26] -> [17].
