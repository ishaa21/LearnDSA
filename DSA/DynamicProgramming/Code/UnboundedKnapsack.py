# Unbounded Knapsack (DP) in Python

def unbounded_knapsack(W, wt, val, n):
    dp = [0] * (W+1)
    for w in range(W+1):
        for i in range(n):
            if wt[i] <= w:
                dp[w] = max(dp[w], dp[w-wt[i]] + val[i])
    return dp[W]

val = [10, 40, 50, 70]
wt = [1, 3, 4, 5]
W = 8
n = 4
print("=== Unbounded Knapsack (Python) ===\n")
print(f"Max value: {unbounded_knapsack(W, wt, val, n)}")
print("\nTime Complexity: O(nW)")
print("Space Complexity: O(W)")
