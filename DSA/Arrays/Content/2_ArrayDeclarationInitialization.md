# Array Declaration & Initialization

## What is this?
Array declaration means creating an array.
Initialization means assigning values to it.

## Why do we need it?
- Without declaration, array cannot be used
- Initialization gives actual data to work with

## Algorithm Logic
Not required.

## Common Mistakes
- Declaring array but not initializing
- Using wrong size
- Mixing data types

## Time Complexity
Initialization: O(n)

## Space Complexity
O(n)

## Real Life Use
- Reserving seats in a cinema
- Setting up a chessboard

## Key Takeaways
- Declaration reserves memory
- Initialization fills data
- Size matters

## Mini Practice
### Problem: Init & Print
Declare an array of size 3, initialize it with 1, 2, 3 and print elements.
Input: (None)
Output: 1, 2, 3
Hint: int arr[3]; arr[0]=1...
Solution: int[] arr = {1, 2, 3}; Print arr[0], arr[1], arr[2].

### Problem: Initialize with Zeros
Create an array of size 5 filled with zeros and print it.
Input: Size = 5
Output: [0, 0, 0, 0, 0]
Hint: Use a loop or built-in method to fill.
Solution: arr = [0]*5 or arr = [0 for i in range(5)]

### Problem: Copy Array
Copy all elements from one array to another.
Input: [1, 2, 3]
Output: Copy: [1, 2, 3]
Hint: Create new array, loop and assign each element.
Solution: new_arr = []; for x in arr: new_arr.append(x)
