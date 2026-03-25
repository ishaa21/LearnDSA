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

## Mini Practice
### Problem: Peek Top
Print top element of [5, 10, 15] using peek.
Input: Stack: [5, 10, 15]
Output: 15
Hint: Just access, don't remove.
Solution: print(stack.peek());

### Problem: Peek After Operations
After Push(10), Push(20), Pop(), Push(30), what does Peek return?
Input: Operations: Push(10), Push(20), Pop(), Push(30)
Output: Peek = 30
Hint: Trace through operations. Pop removes 20, Push adds 30 on top of 10.
Solution: Stack becomes [10, 30] after operations. Peek = 30.

### Problem: Peek Without Pop
Show that peek does not remove the element.
Input: Stack = [1, 2, 3], Peek twice
Output: Both peeks return 3, stack unchanged
Hint: Peek only reads the top, doesn't modify.
Solution: print(stack.peek()) twice, stack size remains 3.
