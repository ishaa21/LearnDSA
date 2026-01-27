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

## Recommended Problems
- Bubble Sort (GFG)
- Sorting: Bubble Sort (HackerRank)

## Mini Practice
### Problem: Bubble Up
Sort [3, 1, 2].
Input: [3, 1, 2]
Output: [1, 2, 3]
Hint:
Pass 1: Swap(3,1)->[1,3,2]. Swap(3,2)->[1,2,3].
Solution: Nested loop. Swap arr[j], arr[j+1].
