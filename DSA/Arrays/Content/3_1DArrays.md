# 1D Arrays

## What is this?
A one-dimensional array stores elements in a single line.

## Why do we need it?
- Simple data storage
- Used in most basic problems

## Algorithm Logic
Traversal using loop.

## Common Mistakes
- Wrong loop bounds
- Index out of range

## Time Complexity
Traversal: O(n)

## Space Complexity
O(n)

## Real Life Use
- To-do list
- Train carriages

## Key Takeaways
- Linear structure
- Easy traversal
- Most common array type

## Mini Practice
### Problem: Sum & Max
Find the sum of array elements and the maximum element.
Input: [1, 5, 3]
Output: Sum: 9, Max: 5
Hint: Loop through array. Keep a 'sum' variable and a 'max' variable.
Solution: Initialize sum=0, max=arr[0]. Loop. sum += arr[i]. max = Max(max, arr[i]).

### Problem: Find Minimum
Find the minimum element in the array.
Input: [7, 2, 9, 1, 5]
Output: Min: 1
Hint: Initialize min with first element, compare with rest.
Solution: min=arr[0]; for i in arr: if i<min: min=i

### Problem: Count Negatives
Count how many negative numbers are in the array.
Input: [3, -1, -7, 5, -2, 8]
Output: 3
Hint: Loop through and check if element < 0.
Solution: count=0; for x in arr: if x<0: count+=1
