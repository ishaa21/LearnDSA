# Heap Sort in Python
# Uses max heap to sort array in ascending order

def heapify(arr, n, i):
    """Heapify subtree rooted at index i"""
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2
    
    if left < n and arr[left] > arr[largest]:
        largest = left
    
    if right < n and arr[right] > arr[largest]:
        largest = right
    
    if largest != i:
        arr[i], arr[largest] = arr[largest], arr[i]
        heapify(arr, n, largest)

def heap_sort(arr):
    """Heap sort algorithm"""
    n = len(arr)
    
    # Build max heap
    for i in range(n // 2 - 1, -1, -1):
        heapify(arr, n, i)
    
    # Extract elements one by one
    for i in range(n - 1, 0, -1):
        arr[0], arr[i] = arr[i], arr[0]
        heapify(arr, i, 0)
    
    return arr

def build_max_heap(arr):
    """Build max heap from array"""
    n = len(arr)
    for i in range(n // 2 - 1, -1, -1):
        heapify(arr, n, i)
    return arr

# Test 1: Basic heap sort
arr = [64, 34, 25, 12, 22, 11, 90]
print("Original Array:", arr)
result = heap_sort(arr.copy())
print("Sorted Array:", result)

# Test 2: Already sorted
arr2 = [1, 2, 3, 4, 5]
print("\nAlready sorted:", arr2)
result2 = heap_sort(arr2.copy())
print("After Heap Sort:", result2)

# Test 3: Reverse sorted
arr3 = [5, 4, 3, 2, 1]
print("\nReverse sorted:", arr3)
result3 = heap_sort(arr3.copy())
print("After Heap Sort:", result3)

# Test 4: Duplicates
arr4 = [5, 2, 8, 2, 9, 1, 5, 5]
print("\nArray with duplicates:", arr4)
result4 = heap_sort(arr4.copy())
print("After Heap Sort:", result4)

# Test 5: Single element
arr5 = [42]
print("\nSingle element:", arr5)
result5 = heap_sort(arr5.copy())
print("After Heap Sort:", result5)

# Test 6: Two elements
arr6 = [50, 30]
print("\nTwo elements:", arr6)
result6 = heap_sort(arr6.copy())
print("After Heap Sort:", result6)

# Test 7: Build max heap
arr7 = [64, 34, 25, 12, 22, 11, 90]
print("\nBuilding max heap from:", arr7)
heap = build_max_heap(arr7.copy())
print("Max heap structure:", heap)

print("\nComplexity Analysis:")
print("Time Complexity: O(n log n) - Linearithmic")
print("Space Complexity: O(1) - In-place")
print("Best Case: O(n log n)")
print("Worst Case: O(n log n)")
print("Average Case: O(n log n)")
print("Stable: No (not stable)")
print("Note: In-place, guaranteed O(n log n), good for large datasets")
