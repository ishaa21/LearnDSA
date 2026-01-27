# LIS (DP) in Python

def lis(arr):
    n = len(arr)
    dp = [1] * n          # dp[i] = length of LIS ending at i
    parent = [-1] * n     # parent[i] = previous index in LIS

    res = 1
    last_index = 0

    # Build dp and parent arrays
    for i in range(1, n):
        for j in range(i):
            if arr[i] > arr[j] and dp[i] < dp[j] + 1:
                dp[i] = dp[j] + 1
                parent[i] = j
        if dp[i] > res:
            res = dp[i]
            last_index = i

    # Reconstruct LIS
    lis_seq = []
    while last_index != -1:
        lis_seq.append(arr[last_index])
        last_index = parent[last_index]

    lis_seq.reverse()
    return res, lis_seq


arr = [10, 22, 9, 33, 21, 50, 41, 60]

print("=== LIS (Python) ===\n")
length, subsequence = lis(arr)
print(f"Length of LIS: {length}")
print(f"LIS: {subsequence}")
print("\nTime Complexity: O(n^2)")
print("Space Complexity: O(n)")