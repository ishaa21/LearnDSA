# Push Operation

## What is this?
Push adds a new element to the top of the stack.

## Why do we need it?
- To store new data in stack.

## Algorithm Logic
1. Check if stack is full
2. Increase top
3. Insert element

## Common Mistakes
- Ignoring overflow condition

## Time Complexity
O(1)

## Space Complexity
O(1)

## Real Life Use
- Stacking plates
- Loading a gun magazine

## Key Takeaways
- Adds element at top
- Constant time operation

## Recommended Problems
- Stack Push Operation (GFG)
- Stack Operations (HackerRank)

## Mini Practice
### Problem: Push Elements
Push 3 elements (10, 20, 30) into a stack and print the top.
Input: Push 10, Push 20, Push 30
Output: Top: 30
Hint: Use push() function.
Solution: stack.push(10); stack.push(20); stack.push(30); print(stack.peek());
