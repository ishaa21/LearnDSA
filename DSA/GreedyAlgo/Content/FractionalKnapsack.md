# FractionalKnapsack

## What is this?
Knapsack where items can be divided (take a fraction of item).

## Why do we need it?
Maximize value when items are divisible (like grains, liquids).

## Algorithm Logic
Sort items by Value/Weight ratio.
Greedily pick items with highest ratio.
If full item doesn't fit, take fraction.

## Common Mistakes
Grouping with 0/1 (where you take whole or leave).

## Time Complexity
O(n log n) (Sorting)

## Space Complexity
O(1)

## Real Life Use
Resource allocation, food distribution.

## Key Takeaways
- Greedy works here (unlike 0/1 Knapsack)
- Sort by bang for buck (value density)

## Recommended Problems
- GFG: Fractional Knapsack

## Mini Practice
### Problem
Input: Items=[(val:60, wt:10), (val:100, wt:20), (val:120, wt:30)], Cap=50
ratio: 6, 5, 4
Output: 60 (all item 1) + 100 (all item 2) + 80 (2/3 of item 3) = 240
Hint: Sort by value/weight first.
Solution: Max Value = 240.
