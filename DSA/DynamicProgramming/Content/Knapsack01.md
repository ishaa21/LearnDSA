# Knapsack01

## What is this?
Each item can be taken once or not at all (0/1).

## Why do we need it?
Resource optimization.
Real-life packing problems.

## Algorithm Logic
Choice-based DP: either include item or exclude it.

## Common Mistakes
Wrong DP state or initial values.

## Time Complexity
O(nW)

## Space Complexity
O(nW)

## Real Life Use
Budget allocation, knapsack packing.

## Key Takeaways
- Classic DP problem
- Subset selection

## Mini Practice
### Problem
Input: Weights=[1,2,3], Values=[10,15,40], Capacity=6
Output: Max Value = 55 (items 2 and 3)
Hint: Standard 0/1 Knapsack DP table.
Solution: 55

### Problem: Subset Sum
Given set [3, 34, 4, 12, 5, 2], is there a subset with sum = 9?
Input: Set=[3,34,4,12,5,2], Target=9
Output: Yes (subset {4, 5} or {3, 4, 2})
Hint: This is a variant of 0/1 Knapsack with values equal to weights.
Solution: dp[i][j] = can we make sum j using first i elements? Same recurrence as Knapsack.

### Problem: Minimum Items
Minimize items selected while maximizing value in Knapsack.
Input: Weights=[2,3,4,5], Values=[3,4,5,6], Capacity=5
Output: Max value=7 (items with weight 2+3=5, value 3+4=7)
Hint: Standard 0/1 Knapsack. Try all combinations using DP.
Solution: dp[i][w] = max(dp[i-1][w], dp[i-1][w-wi] + vi). Fill table bottom-up.
