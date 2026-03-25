# Introduction to Arrays

## What is this?
An array is a collection of values stored together under one name.
Each value is stored at a fixed position called an index.

## Why do we need it?
- To store many values of the same type
- To access data quickly using index
- To avoid creating many separate variables

## Algorithm Logic
Not required. This is a concept introduction.

## Common Mistakes
- Thinking array index starts from 1 (it starts from 0)
- Accessing index outside array size

## Time Complexity
Access by index: O(1)

## Space Complexity
O(n) where n is number of elements

## Real Life Use
- Storing daily temperatures
- Pixel data of an image
- Leaderboard scores

## Key Takeaways
- Array stores same type of data
- Index-based access
- Fixed size in most languages

## Mini Practice
### Problem: Create and Print
Create an array of 5 integers (e.g., 10, 20, 30, 40, 50) and print them.
Input: (None)
Output: 10, 20, 30, 40, 50
Hint: Use a loop or direct access. Indices are 0 to 4.
Solution: Declare int[] arr = {10, 20, 30, 40, 50}; Loop and print.

### Problem: Count Elements
Count total elements in the array.
Input: [10, 20, 30, 40]
Output: 4
Hint: Use a counter variable and loop through.
Solution: Initialize count=0, loop through array, increment count each time.

### Problem: First and Last
Print the first and last element of an array.
Input: [5, 8, 12, 3, 9]
Output: First: 5, Last: 9
Hint: Access index 0 and index length-1.
Solution: print(arr[0], arr[len(arr)-1])
