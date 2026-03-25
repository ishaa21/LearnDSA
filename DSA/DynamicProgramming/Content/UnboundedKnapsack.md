# UnboundedKnapsack

## What is this?
Items can be taken multiple times (unlimited supply).

## Why do we need it?
Coin change problems, cutting stock.

## Algorithm Logic
Unlimited choices for each item.

## Common Mistakes
Using 0/1 logic (only once).

## Time Complexity
O(nW)

## Space Complexity
O(n) - optimized.

## Real Life Use
Making change, cutting rods.

## Key Takeaways
- Repetition allowed
- Often O(W) space

## Mini Practice
### Problem
Input: Coins=[1,2,5], Amount=11
Output: Min coins = 3 (5+5+1)
Hint: DP[i] = min(DP[i], DP[i-coin] + 1)
Solution: 3 coins.
