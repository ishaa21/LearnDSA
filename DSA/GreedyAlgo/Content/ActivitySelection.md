# ActivitySelection

## What is this?
Selecting maximum number of non-overlapping activities.

## Why do we need it?
Scheduling problems.

## Algorithm Logic
Sort by finish time.
Select compatible activities (start time >= last finish time).

## Common Mistakes
Sorting by start time.

## Time Complexity
O(n log n) (due to sorting)

## Space Complexity
O(1)

## Real Life Use
Meeting room scheduling, task scheduling.

## Key Takeaways
- Classic greedy problem
- Sort by finish time is key

## Mini Practice
### Problem
Input: Activities [(1,3), (2,4), (3,5)]
Output: [(1,3), (3,5)] (Count: 2)
Hint: Sort by end time, pick first, then next compatible.
Solution: Select (1,3) then (3,5).
