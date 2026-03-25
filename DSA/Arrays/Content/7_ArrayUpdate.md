# Array Update

## What is this?
Updating means changing value at a specific index.

## Why do we need it?
- To modify existing data

## Algorithm Logic
Direct index access

## Common Mistakes
- Invalid index access

## Time Complexity
O(1)

## Space Complexity
O(1)

## Real Life Use
- Updating score in a game
- Changing user profile name

## Key Takeaways
- Fast operation
- Simple logic

## Mini Practice
### Problem: Update Evens
Update value at index 3 to 100. Then replace all even numbers with 0.
Input: [1, 2, 3, 4]
Output: Index 3 updated: [1, 2, 3, 100]. Evens 0: [1, 0, 3, 0]
Hint: Access index directly. Use modulo % 2 for evens.
Solution: arr[3] = 100; if(arr[i]%2==0) arr[i]=0;

### Problem: Replace Negatives
Replace all negative numbers with 0.
Input: [3, -1, 5, -7, 2]
Output: [3, 0, 5, 0, 2]
Hint: Loop and check if element < 0, replace with 0.
Solution: for i in range(len(arr)): if arr[i]<0: arr[i]=0

### Problem: Double All
Double every element in the array.
Input: [1, 3, 5, 7]
Output: [2, 6, 10, 14]
Hint: Loop through and multiply each by 2.
Solution: for i in range(len(arr)): arr[i] *= 2
