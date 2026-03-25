# Array Deletion

## What is this?
Deletion removes an element from an array.

## Why do we need it?
- To remove unwanted data

## Algorithm Logic
1. Remove target
2. Shift elements left

## Common Mistakes
- Not shifting elements
- Leaving duplicate values at the end

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Deleting a song from playlist
- Removing an item from cart

## Key Takeaways
- Deletion requires shifting
- Size reduces logically

## Mini Practice
### Problem: Delete
Delete element at index 1 from [10, 20, 30].
Input: [10, 20, 30], Index: 1
Output: [10, 30]
Hint: Move 30 to index 1.
Solution: for(i=pos; i<n-1; i++) arr[i] = arr[i+1]; size--;

### Problem: Delete Last Element
Remove the last element from [10, 20, 30, 40].
Input: [10, 20, 30, 40]
Output: [10, 20, 30]
Hint: Simply reduce the array size by 1.
Solution: arr.pop() or reduce length by 1.

### Problem: Delete by Value
Delete the first occurrence of value 30 from [10, 30, 20, 30, 40].
Input: [10, 30, 20, 30, 40], delete 30
Output: [10, 20, 30, 40]
Hint: Find the index of 30 first, then shift elements left.
Solution: Find index of 30, shift elements left from that index.
