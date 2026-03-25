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

## Mini Practice
### Problem: Insert
Sort [2, 3, 1].
Input: [2, 3, 1]
Output: [1, 2, 3]
Hint: 1 is smaller than 3 (shift), smaller than 2 (shift). Insert at 0.
Solution: while(prev >= 0 && arr[prev] > key) shift;

### Problem: Partially Sorted
Apply insertion sort on [2, 1, 3, 5, 4].
Input: [2, 1, 3, 5, 4]
Output: Only 2 shifts needed: 1 shifts left once, 4 shifts left once.
Hint: Nearly sorted arrays are best case for insertion sort.
Solution: Step1: insert 1 before 2 -> [1,2,3,5,4]. Step2: 3,5 already in place. Step3: insert 4 before 5 -> [1,2,3,4,5].

### Problem: Sort Strings
Use insertion sort to sort ["banana", "apple", "cherry"].
Input: ["banana", "apple", "cherry"]
Output: ["apple", "banana", "cherry"]
Hint: Compare strings lexicographically instead of numerically.
Solution: Same algorithm, use string comparison: "apple" < "banana" < "cherry".
