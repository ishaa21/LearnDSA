# Radix Sort

## What is this?
Radix Sort sorts numbers digit by digit (LSD to MSD).

## Why do we need it?
- Efficient for large integers
- Linear time

## Algorithm Logic
- Sort by ones digit (Counting sort)
- Sort by tens digit
- Continue until max digit

## Common Mistakes
- Using unstable sub-sort (Must be stable)

## Time Complexity
O(d × (n + k))

## Space Complexity
O(n + k)

## Real Life Use
- Sorting phone numbers
- Sorting dates

## Key Takeaways
- Non-comparison sort
- Depends on digit count

## Mini Practice
### Problem: Digit Sort
Sort [12, 11] by last digit.
Input: [12, 11]
Output: [11, 12] (Since 1 < 2)
Hint: Stable sort on last digit.
Solution: Use Counting Sort logic on mod 10.
