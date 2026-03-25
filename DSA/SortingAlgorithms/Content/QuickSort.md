# Quick Sort

## What is this?
Quick Sort picks a pivot and partitions array around it (smaller to left, larger to right).

## Why do we need it?
- Very fast in practice (Cache friendly)
- In-place (No extra array needed)

## Algorithm Logic
- Choose pivot
- Partition elements
- Recursively sort partitions

## Common Mistakes
- Bad pivot choice (Worst case O(n²))
- Infinite recursion

## Time Complexity
- Average: O(n log n)
- Worst: O(n²)

## Space Complexity
O(log n) (Stack space)

## Real Life Use
- standard library sort functions (Arrays.sort, std::sort)

## Key Takeaways
- Fast but unstable
- Pivot choice matters

## Mini Practice
### Problem: Partition
Partition [5, 1, 4, 2, 8] around pivot 4.
Input: Array, Pivot 4
Output: [1, 2] 4 [5, 8]
Hint: Swap elements < 4 to left.
Solution: Two pointer swap logic.

### Problem: Choose Pivot
Partition [10, 80, 30, 90, 40, 50, 70] with pivot = 70.
Input: [10, 80, 30, 90, 40, 50, 70], pivot=70
Output: [10, 30, 40, 50, 70, 90, 80]
Hint: Move elements smaller than pivot to left, larger to right.
Solution: After partition: elements <= 70 on left, > 70 on right. Pivot at correct position.

### Problem: Worst Case
What input causes worst case for QuickSort with last element as pivot?
Input: [1, 2, 3, 4, 5]
Output: Already sorted = worst case O(n^2)
Hint: When pivot is always the smallest or largest element.
Solution: Sorted arrays cause unbalanced partitions with last-element pivot.
