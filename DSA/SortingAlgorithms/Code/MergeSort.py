# Merge Sort in Python
# Divide and conquer algorithm - divide array in half, sort, and merge

def merge(arr, left, mid, right):
    """Merge two sorted subarrays"""
    left_arr = arr[left:mid + 1]
    right_arr = arr[mid + 1:right + 1]
    
    i = j = 0
    k = left
    
    while i < len(left_arr) and j < len(right_arr):
        if left_arr[i] <= right_arr[j]:
            arr[k] = left_arr[i]
            i += 1
        else:
            arr[k] = right_arr[j]
            j += 1
        k += 1
    
    while i < len(left_arr):
        arr[k] = left_arr[i]
        i += 1
        k += 1
    
    while j < len(right_arr):
        arr[k] = right_arr[j]
        j += 1
        k += 1

def merge_sort(arr, left=0, right=None):
    """Divide and conquer merge sort"""
    if right is None:
        right = len(arr) - 1
    
    if left < right:
        mid = left + (right - left) // 2
        
        merge_sort(arr, left, mid)
        merge_sort(arr, mid + 1, right)
        merge(arr, left, mid, right)
    
    return arr

def merge_sort_copy(arr):
    """Non-in-place merge sort"""
    if len(arr) <= 1:
        return arr
    
    mid = len(arr) // 2
    left = merge_sort_copy(arr[:mid])
    right = merge_sort_copy(arr[mid:])
    
    return merge_helper(left, right)

def merge_helper(left, right):
    """Helper function to merge two sorted arrays"""
    result = []
    i = j = 0
    
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    
    result.extend(left[i:])
    result.extend(right[j:])
    return result

# Test 1: Basic merge sort
arr = [64, 34, 25, 12, 22, 11, 90]
print("Original Array:", arr)
result = merge_sort(arr.copy())
print("Sorted Array:", result)

# Test 2: Non-in-place version
arr2 = [64, 34, 25, 12, 22, 11, 90]
result2 = merge_sort_copy(arr2)
print("Sorted (Non-in-place):", result2)

# Test 3: Already sorted
arr3 = [1, 2, 3, 4, 5]
print("\nAlready sorted:", arr3)
result3 = merge_sort(arr3.copy())
print("After Merge Sort:", result3)

# Test 4: Reverse sorted
arr4 = [5, 4, 3, 2, 1]
print("\nReverse sorted:", arr4)
result4 = merge_sort(arr4.copy())
print("After Merge Sort:", result4)

# Test 5: Duplicates
arr5 = [5, 2, 8, 2, 9, 1, 5, 5]
print("\nArray with duplicates:", arr5)
result5 = merge_sort(arr5.copy())
print("After Merge Sort:", result5)

# Test 6: Single element
arr6 = [42]
print("\nSingle element:", arr6)
result6 = merge_sort(arr6.copy())
print("After Merge Sort:", result6)

print("\nComplexity Analysis:")
print("Time Complexity: O(n log n) - Linearithmic")
print("Space Complexity: O(n) - Requires temporary arrays")
print("Best Case: O(n log n)")
print("Worst Case: O(n log n)")
print("Average Case: O(n log n)")
print("Stable: Yes")
print("Note: Divide and conquer approach, consistent performance")
