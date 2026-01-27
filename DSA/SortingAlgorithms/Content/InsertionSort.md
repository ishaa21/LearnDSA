# Insertion Sort

## What is this?
Insertion Sort builds sorted array one element at a time by picking element and inserting it into correct position.

## Why do we need it?
- Efficient for small data
- Efficient for nearly sorted data

## Algorithm Logic
- Pick next element
- Shift sorted elements right to make space
- Insert element

## Common Mistakes
- Wrong shifting logic
- Insert at wrong index

## Time Complexity
- Worst: O(n²)
- Best: O(n) (Nearly sorted)

## Space Complexity
O(1)

## Real Life Use
- Sorting playing cards in hand
- Timsort uses it for small chunks

## Key Takeaways
- Stable sort
- Used in real systems for small data

## Recommended Problems
- Insertion Sort (LeetCode)
- Insertion Sort (GFG)

## Mini Practice
### Problem: Insert
Sort [2, 3, 1].
Input: [2, 3, 1]
Output: [1, 2, 3]
Hint: 1 is smaller than 3 (shift), smaller than 2 (shift). Insert at 0.
Solution: while(prev >= 0 && arr[prev] > key) shift;
