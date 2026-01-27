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

## Recommended Problems
- Replace Elements with Greatest Element on Right Side (LeetCode)

## Mini Practice
### Problem: Update Evens
Update value at index 3 to 100. Then replace all even numbers with 0.
Input: [1, 2, 3, 4]
Output: Index 3 updated: [1, 2, 3, 100]. Evens 0: [1, 0, 3, 0]
Hint: Access index directly. Use modulo % 2 for evens.
Solution: arr[3] = 100; if(arr[i]%2==0) arr[i]=0;
