# Pop Operation

## What is this?
Pop removes the top element from the stack.

## Why do we need it?
- To remove recently added data.

## Algorithm Logic
1. Check if stack is empty
2. Remove top element
3. Decrease top

## Common Mistakes
- Pop without checking empty stack

## Time Complexity
O(1)

## Space Complexity
O(1)

## Real Life Use
- Undo button (removes last action)
- Removing a plate from a stack

## Key Takeaways
- Removes last inserted element
- LIFO behavior

## Recommended Problems
- Stack Pop Operation (GFG)
- Implement Stack using Arrays (LeetCode)

## Mini Practice
### Problem: Pop Element
Pop an element from [10, 20] and display it.
Input: Stack: [10, 20] (Top is 20)
Output: Popped: 20
Hint: Use pop() function.
Solution: int val = stack.pop(); print(val);
