# Selection Sort

## What is this?
Selection Sort selects the smallest element from unsorted part and places it at correct position.

## Why do we need it?
- Simple logic
- Predictable behavior (Always O(n²))
- Fewer swaps than Bubble Sort

## Algorithm Logic
1. Find minimum in unsorted array
2. Swap with first unsorted position
3. Repeat

## Common Mistakes
- Extra swaps (swapping with itself)
- Resetting min index incorrectly

## Time Complexity
O(n²)

## Space Complexity
O(1)

## Real Life Use
- Sorting small lists where writing to memory is expensive (Flash memory)

## Key Takeaways
- Fewer swaps
- Still slow for large data

## Mini Practice
### Problem: Select Min
Sort [2, 1, 3] manually.
Input: [2, 1, 3]
Output: [1, 2, 3]
Hint: Min is 1. Swap(2, 1) -> [1, 2, 3].
Solution: Find min index, swap with i.

### Problem: Sort Descending
Modify selection sort to sort in descending order.
Input: [3, 1, 4, 1, 5]
Output: [5, 4, 3, 1, 1]
Hint: Instead of finding minimum, find maximum in each pass.
Solution: In each pass, find the maximum element and swap with current position.

### Problem: Count Comparisons
Count total comparisons for selection sort on [64, 25, 12, 22, 11].
Input: [64, 25, 12, 22, 11]
Output: 10 comparisons (n*(n-1)/2 = 5*4/2 = 10)
Hint: In pass i, you make (n-i-1) comparisons.
Solution: Pass 0: 4, Pass 1: 3, Pass 2: 2, Pass 3: 1. Total = 10.
