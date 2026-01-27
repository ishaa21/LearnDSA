# Array Insertion

## What is this?
Insertion means adding a new element at a given position.

## Why do we need it?
- To update data
- To maintain order

## Algorithm Logic
1. Shift elements to right
2. Insert new value

## Common Mistakes
- Forgetting to shift elements
- Overflow in fixed-size arrays

## Time Complexity
O(n)

## Space Complexity
O(1) (if space available)

## Real Life Use
- Adding a person to a queue
- Inserting a page in a document

## Key Takeaways
- Shifting is required
- Costly for large arrays

## Recommended Problems
- Insert an Element at Position (GFG)
- Array Insertion Basics (Codeforces)

## Mini Practice
### Problem: Insert at Index
Insert element 99 at index 2 in [10, 20, 30, 40].
Input: [10, 20, 30, 40], Value: 99, Index: 2
Output: [10, 20, 99, 30, 40]
Hint: Start from end. Shift 40 to pos 4, 30 to pos 3. Then put 99 at pos 2.
Solution: for(i=n; i>pos; i--) arr[i] = arr[i-1]; arr[pos] = val;
