# Peek Operation

## What is this?
Peek returns the top element without removing it.

## Why do we need it?
- To see top element safely.

## Algorithm Logic
Return element at top index

## Common Mistakes
- Calling peek on empty stack

## Time Complexity
O(1)

## Space Complexity
O(1)

## Real Life Use
- Checking who called last without answering
- Previewing next action

## Key Takeaways
- No removal
- Read-only operation

## Recommended Problems
- Peek Operation in Stack (GFG)

## Mini Practice
### Problem: Peek Top
Print top element of [5, 10, 15] using peek.
Input: Stack: [5, 10, 15]
Output: 15
Hint: Just access, don't remove.
Solution: print(stack.peek());
