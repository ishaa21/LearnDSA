# Valid Parentheses

## What is this?
Check if parentheses in a string are balanced and ordered correctly. e.g., "()" is valid, ")(" is not.

## Why do we need it?
- Syntax checking in compilers
- Linting code

## Algorithm Logic
1. Traverse string
2. Push opening brackets '(', '{', '['
3. On closing bracket, check if stack top matches counterpart. Pop.
4. If stack empty at end -> Valid.

## Common Mistakes
- Ignoring empty stack when popping
- Stack not empty at end

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
- IDEs (highlighting matching braces)
- Math expression parsers

## Key Takeaways
- Classic stack problem
- Very important for interviews

## Mini Practice
### Problem: Check Balance
Check if "{[()]}" is valid.
Input: "{[()]}"
Output: Valid
Hint: Push {, Push [, Push (. Match ) with (. Match ] with [. Match } with {.
Solution: Use stack. Return stack.isEmpty() at end.

### Problem: Multiple Bracket Types
Check if the string has valid brackets.
Input: "{[()]}"
Output: Valid
Hint: Push opening brackets, pop and match for closing brackets.
Solution: For each char: if opening push; if closing pop and check match. Return stack.isEmpty().

### Problem: Unbalanced Detection
Find which position has the first unbalanced bracket.
Input: "((())"
Output: Position 0 is unbalanced (extra opening bracket)
Hint: After processing, remaining items in stack are unbalanced.
Solution: Process all chars. If stack not empty, remaining positions are unbalanced.
