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

## Mini Practice
### Problem: Insert at Index
Insert element 99 at index 2 in [10, 20, 30, 40].
Input: [10, 20, 30, 40], Value: 99, Index: 2
Output: [10, 20, 99, 30, 40]
Hint: Start from end. Shift 40 to pos 4, 30 to pos 3. Then put 99 at pos 2.
Solution: for(i=n; i>pos; i--) arr[i] = arr[i-1]; arr[pos] = val;

### Problem: Insert at Beginning
Insert element 99 at the beginning of [1, 2, 3].
Input: arr=[1,2,3], element=99, position=0
Output: [99, 1, 2, 3]
Hint: Shift all elements right by one position first.
Solution: Shift arr[i+1]=arr[i] from end to start, then arr[0]=99.

### Problem: Insert Sorted
Insert 15 into sorted array [5, 10, 20, 25] maintaining order.
Input: [5, 10, 20, 25], insert 15
Output: [5, 10, 15, 20, 25]
Hint: Find correct position, shift elements right, then insert.
Solution: Find i where arr[i]>15, shift right from end to i, arr[i]=15.
