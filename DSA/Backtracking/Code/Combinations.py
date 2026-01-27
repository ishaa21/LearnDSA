# Combinations using Backtracking in Python
def combine(arr, r, idx, data, i):
    if idx == r:
        print(data)
        return
    if i >= len(arr):
        return
    combine(arr, r, idx+1, data+[arr[i]], i+1)
    combine(arr, r, idx, data, i+1)

arr = [1, 2, 3, 4]
r = 2
print("=== Combinations (Python) ===\n")
combine(arr, r, 0, [], 0)
print("\nTime Complexity: O(C(n, r) * r)")
print("Space Complexity: O(r)")
