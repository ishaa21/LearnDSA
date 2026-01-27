# Memoization Example in Python

def fib(n, dp):
    if n <= 1:
        return n
    if dp[n] != -1:
        return dp[n]
    dp[n] = fib(n-1, dp) + fib(n-2, dp)
    return dp[n]

n = 10
dp = [-1] * 100
print("=== Memoization Example (Python) ===\n")
print(f"Fibonacci({n}) = {fib(n, dp)}")
print("\nTime Complexity: O(n)")
print("Space Complexity: O(n)")
