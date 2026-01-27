# Bubble Sort in Python
# Repeatedly swap adjacent elements if they are in wrong order

def bubble_sort(arr):
    """Basic bubble sort"""
    n = len(arr)
    for i in range(n - 1):
        for j in range(n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

def bubble_sort_optimized(arr):
    """Optimized bubble sort with early termination"""
    n = len(arr)
    for i in range(n - 1):
        swapped = False
        for j in range(n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                swapped = True
        if not swapped:
            break
    return arr

def bubble_sort_descending(arr):
    """Bubble sort in descending order"""
    n = len(arr)
    for i in range(n - 1):
        for j in range(n - i - 1):
            if arr[j] < arr[j + 1]:  # Changed comparison for descending
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

# Test 1: Basic bubble sort
arr = [64, 34, 25, 12, 22, 11, 90]
print("Original Array:", arr)
result = bubble_sort(arr.copy())
print("Sorted (Bubble Sort):", result)

# Test 2: Optimized version
arr2 = [64, 34, 25, 12, 22, 11, 90]
result2 = bubble_sort_optimized(arr2)
print("Sorted (Optimized):", result2)

# Test 3: Already sorted
arr3 = [1, 2, 3, 4, 5]
print("\nAlready sorted:", arr3)
result3 = bubble_sort_optimized(arr3.copy())
print("After Bubble Sort:", result3)

# Test 4: Reverse sorted
arr4 = [5, 4, 3, 2, 1]
print("\nReverse sorted:", arr4)
result4 = bubble_sort(arr4.copy())
print("After Bubble Sort:", result4)

# Test 5: Descending order
arr5 = [64, 34, 25, 12, 22, 11, 90]
print("\nDescending order sorting:")
result5 = bubble_sort_descending(arr5.copy())
print("Sorted (Descending):", result5)

# Test 6: Array with duplicates
arr6 = [5, 2, 8, 2, 9, 1, 5, 5]
print("\nArray with duplicates:", arr6)
result6 = bubble_sort_optimized(arr6.copy())
print("After Bubble Sort:", result6)

print("\nComplexity Analysis:")
print("Time Complexity: O(n^2) - Quadratic")
print("Space Complexity: O(1) - In-place")
print("Best Case: O(n) - Already sorted (optimized)")
print("Worst Case: O(n^2) - Reverse sorted")
print("Stable: Yes")
