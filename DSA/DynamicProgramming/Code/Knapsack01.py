# 0/1 Knapsack (DP) in Python

def knapsack(W, wt, val, n):
    dp = [[0 for _ in range(W+1)] for _ in range(n+1)]
    for i in range(n+1):
        for w in range(W+1):
            if i == 0 or w == 0:
                dp[i][w] = 0
            elif wt[i-1] <= w:
                dp[i][w] = max(val[i-1] + dp[i-1][w-wt[i-1]], dp[i-1][w])
            else:
                dp[i][w] = dp[i-1][w]
    return dp[n][W]

val = [60, 100, 120]
wt = [10, 20, 30]
W = 50
n = 3
print("=== 0/1 Knapsack (Python) ===\n")
print(f"Max value: {knapsack(W, wt, val, n)}")
print("\nTime Complexity: O(nW)")
print("Space Complexity: O(nW)")
