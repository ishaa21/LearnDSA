# Subsets using Backtracking in Python
def print_subset(arr, idx, subset):
    if idx == len(arr):
        print(subset)
        return
    # Include arr[idx]
    print_subset(arr, idx+1, subset + [arr[idx]])
    # Exclude arr[idx]
    print_subset(arr, idx+1, subset)

arr = [1, 2, 3]
print("=== Subsets (Python) ===\n")
print_subset(arr, 0, [])
print("\nTime Complexity: O(2^n * n)")
print("Space Complexity: O(n)")
