# LCS (DP) in Python

def lcs(X, Y):
    m = len(X)
    n = len(Y)
    dp = [[0]*(n+1) for _ in range(m+1)]

    # Build DP table
    for i in range(m+1):
        for j in range(n+1):
            if i == 0 or j == 0:
                dp[i][j] = 0
            elif X[i-1] == Y[j-1]:
                dp[i][j] = 1 + dp[i-1][j-1]
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])

    # Reconstruct LCS string
    i, j = m, n
    lcs_str = []
    while i > 0 and j > 0:
        if X[i-1] == Y[j-1]:
            lcs_str.append(X[i-1])
            i -= 1
            j -= 1
        elif dp[i-1][j] > dp[i][j-1]:
            i -= 1
        else:
            j -= 1

    lcs_str.reverse()  # reverse to get correct order
    return dp[m][n], "".join(lcs_str)


X = "AGGTAB"
Y = "GXTXAYB"

print("=== LCS (Python) ===\n")
length, subsequence = lcs(X, Y)
print(f"Length of LCS: {length}")
print(f"LCS: {subsequence}")
print("\nTime Complexity: O(mn)")
print("Space Complexity: O(mn)")