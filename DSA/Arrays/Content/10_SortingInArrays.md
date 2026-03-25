# Sorting in Arrays

## What is this?
Sorting arranges elements in order.

## Why do we need it?
- Faster searching
- Better organization

## Algorithm Logic
Depends on algorithm (Bubble, Selection, etc.)

## Common Mistakes
- Wrong comparisons
- Extra swaps

## Time Complexity
- Bubble: O(n²)
- Efficient sorts: O(n log n)

## Space Complexity
Depends on method (O(1) to O(n))

## Real Life Use
- Ranking scores
- Organizing files by size

## Key Takeaways
- Many sorting techniques
- Choice matters

## Mini Practice
### Problem: Basic Sort
Sort array in ascending order.
Input: [3, 1, 2]
Output: [1, 2, 3]
Hint: Use Arrays.sort() or a simple Bubble Sort loop.
Solution: Arrays.sort(arr); // or swap elements if arr[j] > arr[j+1]

### Problem: Sort and Find Median
Sort the array and find the median element.
Input: [7, 2, 9, 1, 5]
Output: Sorted: [1, 2, 5, 7, 9], Median: 5
Hint: Sort first, then median is the middle element.
Solution: Sort array. If odd length: arr[n//2]. If even: (arr[n//2-1]+arr[n//2])/2.

### Problem: Check if Sorted
Determine if the array is already sorted in ascending order.
Input: [1, 3, 5, 7, 9]
Output: Yes, sorted
Hint: Compare each element with the next one.
Solution: for i in range(len(arr)-1): if arr[i]>arr[i+1]: return False
