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

## Mini Practice
### Problem: Pop Element
Pop an element from [10, 20] and display it.
Input: Stack: [10, 20] (Top is 20)
Output: Popped: 20
Hint: Use pop() function.
Solution: int val = stack.pop(); print(val);

### Problem: Pop All Elements
Pop all elements from stack [10, 20, 30] and print each.
Input: Stack = [10, 20, 30]
Output: 30, 20, 10 (LIFO order)
Hint: Keep popping until stack is empty.
Solution: while not stack.isEmpty(): print(stack.pop())

### Problem: Pop and Sum
Pop all elements and find their sum.
Input: Stack = [5, 15, 25]
Output: Sum = 45
Hint: Pop each element, add to running sum.
Solution: sum=0; while not empty: sum += stack.pop()
