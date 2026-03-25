# Array Traversal

## What is this?
Traversal means visiting each element once.

## Why do we need it?
- To read or process elements

## Algorithm Logic
Loop through array

## Common Mistakes
- Wrong loop condition

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Reading all notifications
- Calculating total bill

## Key Takeaways
- Fundamental operation
- Used everywhere

## Mini Practice
### Problem: Count Evens
Print all elements and count how many are even.
Input: [1, 2, 4, 5]
Output: 2, 4. Count: 2
Hint: Loop from 0 to n. Check if (x % 2 == 0).
Solution: int count = 0; for(int x : arr) { if(x%2==0) count++; }

### Problem: Print Reverse
Print array elements in reverse order.
Input: [1, 2, 3, 4, 5]
Output: 5 4 3 2 1
Hint: Loop from last index to 0.
Solution: for i in range(len(arr)-1, -1, -1): print(arr[i])

### Problem: Find Second Largest
Find the second largest element.
Input: [12, 35, 1, 10, 34, 1]
Output: 34
Hint: Track both largest and second largest while traversing.
Solution: Keep two variables: first and second. Update both as you traverse.
