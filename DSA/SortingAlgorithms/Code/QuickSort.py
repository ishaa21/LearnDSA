# Quick Sort in Python
# Divide and conquer algorithm using pivot element partitioning

def partition(arr, low, high):
    """Partition using last element as pivot"""
    pivot = arr[high]
    i = low - 1
    
    for j in range(low, high):
        if arr[j] < pivot:
            i += 1
            arr[i], arr[j] = arr[j], arr[i]
    
    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    return i + 1

def quick_sort(arr, low=0, high=None):
    """Basic quick sort"""
    if high is None:
        high = len(arr) - 1
    
    if low < high:
        pi = partition(arr, low, high)
        
        quick_sort(arr, low, pi - 1)
        quick_sort(arr, pi + 1, high)
    
    return arr

def partition_random(arr, low, high):
    """Partition using random pivot"""
    import random
    random_idx = random.randint(low, high)
    arr[random_idx], arr[high] = arr[high], arr[random_idx]
    return partition(arr, low, high)

def quick_sort_random(arr, low=0, high=None):
    """Quick sort with random pivot"""
    if high is None:
        high = len(arr) - 1
    
    if low < high:
        pi = partition_random(arr, low, high)
        
        quick_sort_random(arr, low, pi - 1)
        quick_sort_random(arr, pi + 1, high)
    
    return arr

def partition_3way(arr, low, high):
    """3-way partition for handling duplicates"""
    pivot = arr[high]
    i = low
    j = high
    k = low
    
    while k <= j:
        if arr[k] < pivot:
            arr[i], arr[k] = arr[k], arr[i]
            i += 1
            k += 1
        elif arr[k] > pivot:
            arr[k], arr[j] = arr[j], arr[k]
            j -= 1
        else:
            k += 1
    
    return i, j

# Test 1: Basic quick sort
arr = [64, 34, 25, 12, 22, 11, 90]
print("Original Array:", arr)
result = quick_sort(arr.copy())
print("Sorted Array:", result)

# Test 2: With random pivot
arr2 = [64, 34, 25, 12, 22, 11, 90]
result2 = quick_sort_random(arr2)
print("\nSorted (Random Pivot):", result2)

# Test 3: Already sorted
arr3 = [1, 2, 3, 4, 5]
print("\nAlready sorted:", arr3)
result3 = quick_sort(arr3.copy())
print("After Quick Sort:", result3)

# Test 4: Reverse sorted
arr4 = [5, 4, 3, 2, 1]
print("\nReverse sorted:", arr4)
result4 = quick_sort(arr4.copy())
print("After Quick Sort:", result4)

# Test 5: Duplicates
arr5 = [5, 2, 8, 2, 9, 1, 5, 5]
print("\nArray with duplicates:", arr5)
result5 = quick_sort(arr5.copy())
print("After Quick Sort:", result5)

# Test 6: Single element
arr6 = [42]
print("\nSingle element:", arr6)
result6 = quick_sort(arr6.copy())
print("After Quick Sort:", result6)

print("\nComplexity Analysis:")
print("Time Complexity: O(n log n) - Average, O(n^2) - Worst")
print("Space Complexity: O(log n) - Due to recursion stack")
print("Best Case: O(n log n)")
print("Worst Case: O(n^2) - Already sorted or reverse sorted")
print("Average Case: O(n log n)")
print("Stable: No (not stable)")
print("Note: In-place sorting, efficient on large datasets")
