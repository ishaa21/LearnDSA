# CoinChange

## What is this?
Finding minimum coins change using greedy choice.

## Why do we need it?
Currency systems, making change efficiently.

## Algorithm Logic
Pick largest coin first that is <= remaining amount.
Repeat.

## Common Mistakes
Using greedy for non-canonical coin systems (e.g. {1, 3, 4}, target 6 -> Greedy: 4,1,1 (3 coins), Optimal: 3,3 (2 coins)).

## Time Complexity
O(n) (where n is number of coin types, assuming sorted)

## Space Complexity
O(1)

## Real Life Use
Standard currency systems (US Dollar, Euro, etc) are designed for greedy approach.

## Key Takeaways
- Works ONLY for canonical coin systems
- Fails for arbitrary coin sets (need DP for general case)

## Mini Practice
### Problem
Input: Coins=[1, 5, 10, 25], Amount=30
Output: 2 coins (25 + 5)
Hint: Pick largest possible coin first.
Solution: 25 -> 5 left -> 5 -> 0 left. Total 2.
