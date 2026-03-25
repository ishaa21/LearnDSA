# Stack Implementation (Array)

## What is this?
Stack implemented using array.

## Why do we need it?
- Simple implementation
- Faster access

## Algorithm Logic
Use array + top variable

## Common Mistakes
- Fixed size overflow

## Time Complexity
- Push/Pop: O(1)

## Space Complexity
O(n)

## Real Life Use
- Memory management (Stack memory)
- Function call stack

## Key Takeaways
- Fast but fixed size
- Easy to code

## Mini Practice
### Problem: Array Stack
Implement push/pop using an array of size 5.
Input: Push 1, Push 2
Output: Stack: [1, 2]
Hint: Use 'top' index to track position.
Solution: arr[++top] = val; return arr[top--];
