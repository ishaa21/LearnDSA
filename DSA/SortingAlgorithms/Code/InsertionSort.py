# Insertion Sort in Python
# Build sorted array one item at a time by inserting elements at correct position

def insertion_sort(arr):
    """Basic insertion sort"""
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        
        arr[j + 1] = key
    
    return arr

def insertion_sort_with_stats(arr):
    """Insertion sort with comparison and shift count"""
    comparisons = 0
    shifts = 0
    
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        
        while j >= 0 and arr[j] > key:
            comparisons += 1
            arr[j + 1] = arr[j]
            shifts += 1
            j -= 1
        
        comparisons += 1
        arr[j + 1] = key
    
    return arr, comparisons, shifts

def insertion_sort_descending(arr):
    """Insertion sort in descending order"""
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        
        while j >= 0 and arr[j] < key:  # Changed for descending
            arr[j + 1] = arr[j]
            j -= 1
        
        arr[j + 1] = key
    
    return arr

# Test 1: Basic insertion sort
arr = [64, 34, 25, 12, 22, 11, 90]
print("Original Array:", arr)
result = insertion_sort(arr.copy())
print("Sorted Array:", result)

# Test 2: With statistics
arr2 = [64, 34, 25, 12, 22, 11, 90]
result2, comps, shifts = insertion_sort_with_stats(arr2)
print(f"\nInsertion Sort with statistics:")
print(f"Sorted: {result2}")
print(f"Comparisons: {comps}, Shifts: {shifts}")

# Test 3: Already sorted
arr3 = [1, 2, 3, 4, 5]
print("\nAlready sorted:", arr3)
result3 = insertion_sort(arr3.copy())
print("After Insertion Sort:", result3)

# Test 4: Reverse sorted
arr4 = [5, 4, 3, 2, 1]
print("\nReverse sorted:", arr4)
result4 = insertion_sort(arr4.copy())
print("After Insertion Sort:", result4)

# Test 5: Descending order
arr5 = [64, 34, 25, 12, 22, 11, 90]
print("\nDescending order:")
result5 = insertion_sort_descending(arr5.copy())
print("Sorted (Descending):", result5)

# Test 6: Duplicates
arr6 = [5, 2, 8, 2, 9, 1, 5, 5]
print("\nArray with duplicates:", arr6)
result6 = insertion_sort(arr6.copy())
print("After Insertion Sort:", result6)

# Test 7: Nearly sorted (best case)
arr7 = [1, 2, 3, 5, 4, 6, 7]
print("\nNearly sorted (best case):", arr7)
result7, comps7, shifts7 = insertion_sort_with_stats(arr7.copy())
print(f"After Insertion Sort: {result7}")
print(f"Comparisons: {comps7}, Shifts: {shifts7}")

print("\nComplexity Analysis:")
print("Time Complexity: O(n^2) - Quadratic")
print("Space Complexity: O(1) - In-place")
print("Best Case: O(n) - Already sorted")
print("Worst Case: O(n^2) - Reverse sorted")
print("Average Case: O(n^2)")
print("Stable: Yes")
print("Adaptive: Yes - performs well on nearly sorted data")
