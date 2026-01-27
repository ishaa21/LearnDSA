# Selection Sort in Python
# Find minimum element and place at beginning, repeat for remaining array

def selection_sort(arr):
    """Basic selection sort"""
    n = len(arr)
    for i in range(n - 1):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    return arr

def selection_sort_with_stats(arr):
    """Selection sort with comparison and swap count"""
    n = len(arr)
    comparisons = 0
    swaps = 0
    
    for i in range(n - 1):
        min_idx = i
        for j in range(i + 1, n):
            comparisons += 1
            if arr[j] < arr[min_idx]:
                min_idx = j
        if min_idx != i:
            arr[i], arr[min_idx] = arr[min_idx], arr[i]
            swaps += 1
    
    return arr, comparisons, swaps

def selection_sort_descending(arr):
    """Selection sort in descending order"""
    n = len(arr)
    for i in range(n - 1):
        max_idx = i
        for j in range(i + 1, n):
            if arr[j] > arr[max_idx]:  # Changed for descending
                max_idx = j
        arr[i], arr[max_idx] = arr[max_idx], arr[i]
    return arr

# Test 1: Basic selection sort
arr = [64, 34, 25, 12, 22, 11, 90]
print("Original Array:", arr)
result = selection_sort(arr.copy())
print("Sorted Array:", result)

# Test 2: With statistics
arr2 = [64, 34, 25, 12, 22, 11, 90]
result2, comps, swaps = selection_sort_with_stats(arr2)
print(f"\nSelection Sort with statistics:")
print(f"Sorted: {result2}")
print(f"Comparisons: {comps}, Swaps: {swaps}")

# Test 3: Already sorted
arr3 = [1, 2, 3, 4, 5]
print("\nAlready sorted:", arr3)
result3 = selection_sort(arr3.copy())
print("After Selection Sort:", result3)

# Test 4: Reverse sorted
arr4 = [5, 4, 3, 2, 1]
print("\nReverse sorted:", arr4)
result4 = selection_sort(arr4.copy())
print("After Selection Sort:", result4)

# Test 5: Descending order
arr5 = [64, 34, 25, 12, 22, 11, 90]
print("\nDescending order:")
result5 = selection_sort_descending(arr5.copy())
print("Sorted (Descending):", result5)

# Test 6: Duplicates
arr6 = [5, 2, 8, 2, 9, 1, 5, 5]
print("\nArray with duplicates:", arr6)
result6 = selection_sort(arr6.copy())
print("After Selection Sort:", result6)

print("\nComplexity Analysis:")
print("Time Complexity: O(n^2) - Quadratic")
print("Space Complexity: O(1) - In-place")
print("Best Case: O(n^2)")
print("Worst Case: O(n^2)")
print("Average Case: O(n^2)")
print("Stable: No (not stable)")
print("Number of swaps: At most n-1")
