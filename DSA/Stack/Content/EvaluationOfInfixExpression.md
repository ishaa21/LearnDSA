# Evaluation of Infix Expression

## What is this?
Evaluating a standard math expression where operators are written between operands (e.g., 2 + 3).

## Why do we need it?
- Most common mathematical expression format.
- Used in calculators and programming languages.

## Algorithm Logic
- Use two stacks: one for operands and one for operators.
- Use precedence rules to determine which operator to process first.

## Common Mistakes
- Incorrectly handling operator precedence.
- Forgetting to process remaining operators at the end.

## Time Complexity
O(n) where n is the length of the expression.

## Space Complexity
O(n) for stacks.

## Real Life Use
Scientific calculators.

## Key Takeaways
- Requires two stacks.
- Respects BIDMAS/PEMDAS rules.

## Recommended Problems
- Evaluate Infix Expression (GFG)

## Mini Practice
### Problem: Simple Sum
Evaluate "10 + 2 * 6".
Input: "10 + 2 * 6"
Output: 22
Hint: Perform multiplication before addition.
Solution: 10 + (2 * 6) = 22.
