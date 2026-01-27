# Permutations using Backtracking in Python
def permute(arr, l, r):
    if l == r:
        print(arr)
        return
    for i in range(l, r+1):
        arr[l], arr[i] = arr[i], arr[l]
        permute(arr, l+1, r)
        arr[l], arr[i] = arr[i], arr[l]

arr = [1, 2, 3]
print("=== Permutations (Python) ===\n")
permute(arr, 0, len(arr)-1)
print("\nTime Complexity: O(n! * n)")
print("Space Complexity: O(n)")
