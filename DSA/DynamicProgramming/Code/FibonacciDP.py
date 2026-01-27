# Fibonacci using DP (Tabulation) in Python

def fib(n):
    dp = [0] * (n+1)
    dp[0] = 0
    dp[1] = 1
    for i in range(2, n+1):
        dp[i] = dp[i-1] + dp[i-2]
    return dp[n]

n = 10
print("=== Fibonacci using DP (Python) ===\n")
print(f"Fibonacci({n}) = {fib(n)}")
print("\nTime Complexity: O(n)")
print("Space Complexity: O(n)")
