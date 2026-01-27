# Matrix Chain Multiplication (DP) in Python
import sys

def matrix_chain_order(p):
    n = len(p)
    m = [[0]*n for _ in range(n)]
    for L in range(2, n):
        for i in range(1, n-L+1):
            j = i+L-1
            m[i][j] = sys.maxsize
            for k in range(i, j):
                q = m[i][k] + m[k+1][j] + p[i-1]*p[k]*p[j]
                if q < m[i][j]:
                    m[i][j] = q
    return m[1][n-1]

arr = [1, 2, 3, 4]
print("=== Matrix Chain Multiplication (Python) ===\n")
print(f"Minimum multiplications: {matrix_chain_order(arr)}")
print("\nTime Complexity: O(n^3)")
print("Space Complexity: O(n^2)")
