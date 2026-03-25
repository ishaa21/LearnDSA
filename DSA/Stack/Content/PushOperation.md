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

## Mini Practice
### Problem: Push Elements
Push 3 elements (10, 20, 30) into a stack and print the top.
Input: Push 10, Push 20, Push 30
Output: Top: 30
Hint: Use push() function.
Solution: stack.push(10); stack.push(20); stack.push(30); print(stack.peek());

### Problem: Stack from Array
Push all elements of [5, 10, 15, 20] into a stack and print state after each push.
Input: [5, 10, 15, 20]
Output: After pushes: Stack = [5, 10, 15, 20], Top = 20
Hint: Push one by one and print the stack state.
Solution: for x in arr: stack.push(x); print(stack)

### Problem: Push if Not Full
Push element 50 into a stack of max size 3 that already has [10, 20, 30].
Input: Stack=[10,20,30], MaxSize=3, Push 50
Output: Stack Overflow! Cannot push.
Hint: Check stack size before pushing.
Solution: if stack.size() >= maxSize: print("Overflow") else: stack.push(50)
