# Bubble Sort

## What is this?
Bubble Sort repeatedly swaps adjacent elements if they are in wrong order. Small elements "bubble" to the top.

## Why do we need it?
- Easy to understand
- Good for learning sorting basics
- Can detect if list is already sorted (using a flag)

## Algorithm Logic
- Compare adjacent elements
- Swap if needed
- Repeat until sorted

## Common Mistakes
- Forgetting early stop optimization (break if no swaps)
- Running loop too many times

## Time Complexity
- Worst/Average: O(n²)
- Best: O(n) (already sorted)

## Space Complexity
O(1)

## Real Life Use
- Teaching basic logic
- Checking if list is sorted

## Key Takeaways
- Simple but slow
- Rarely used in practice for large data

## Mini Practice
### Problem: Bubble Up
Sort [3, 1, 2].
Input: [3, 1, 2]
Output: [1, 2, 3]
Hint:
Pass 1: Swap(3,1)->[1,3,2]. Swap(3,2)->[1,2,3].
Solution: Nested loop. Swap arr[j], arr[j+1].

### Problem: Count Swaps
Count total swaps needed to sort [5, 3, 1].
Input: [5, 3, 1]
Output: 3 swaps. Pass1: (5,3)->(3,5,1), (5,1)->(3,1,5). Pass2: (3,1)->(1,3,5).
Hint: Track a swap counter inside the nested loop.
Solution: swapCount=0; on each swap: swapCount++. Total = 3.

### Problem: Already Sorted Detection
Apply optimized bubble sort on [1, 2, 3, 4, 5].
Input: [1, 2, 3, 4, 5]
Output: 0 swaps, detected sorted in 1 pass
Hint: Use a swapped flag. If no swaps in a pass, array is sorted.
Solution: In first pass, no swaps occur. Flag stays false. Break early.
