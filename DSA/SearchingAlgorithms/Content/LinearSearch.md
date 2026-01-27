# Linear Search

## What is this?
Linear Search checks each element one by one from left to right.

## Why do we need it?
- Works on any data (Sorted or Unsorted)
- Very simple to implement

## Algorithm Logic
1. Start from first element
2. Compare with target
3. Stop if found

## Common Mistakes
- Not stopping searching after finding the element
- Ignoring return -1 for not found

## Time Complexity
- Average/Worst: O(n)
- Best: O(1) (First element matches)

## Space Complexity
O(1)

## Real Life Use
- Looking for a pen in a drawer
- Searching for a contact in an unsorted list

## Key Takeaways
- Simple but slow
- Universal applicability

## Recommended Problems
- Linear Search (LeetCode)
- Search an Element (GFG)

## Mini Practice
### Problem: Simple Search
Find index of 5 in [1, 2, 5, 3].
Input: [1, 2, 5, 3], Target 5
Output: Index 2
Hint: Loop i from 0 to n.
Solution: if(arr[i]==target) return i;
