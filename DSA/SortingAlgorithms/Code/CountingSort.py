# Counting Sort in Python
# Non-comparison sort - counts occurrences of each element

def counting_sort(arr):
    """Counting sort for non-negative integers"""
    if not arr:
        return arr
    
    max_val = max(arr)
    min_val = min(arr)
    range_val = max_val - min_val + 1
    
    count = [0] * range_val
    
    for num in arr:
        count[num - min_val] += 1
    
    for i in range(1, range_val):
        count[i] += count[i - 1]
    
    output = [0] * len(arr)
    for i in range(len(arr) - 1, -1, -1):
        output[count[arr[i] - min_val] - 1] = arr[i]
        count[arr[i] - min_val] -= 1
    
    return output

def counting_sort_range(arr, max_val):
    """Counting sort for range [0, max_val]"""
    count = [0] * (max_val + 1)
    
    for num in arr:
        count[num] += 1
    
    output = []
    for i in range(max_val + 1):
        output.extend([i] * count[i])
    
    return output

def counting_sort_by_digit(arr, exp):
    """Counting sort based on digit for radix sort"""
    n = len(arr)
    output = [0] * n
    count = [0] * 10
    
    for i in range(n):
        index = (arr[i] // exp) % 10
        count[index] += 1
    
    for i in range(1, 10):
        count[i] += count[i - 1]
    
    for i in range(n - 1, -1, -1):
        index = (arr[i] // exp) % 10
        output[count[index] - 1] = arr[i]
        count[index] -= 1
    
    return output

# Test 1: Basic counting sort
arr = [64, 34, 25, 12, 22, 11, 90]
print("Original Array:", arr)
result = counting_sort(arr.copy())
print("Sorted Array:", result)

# Test 2: Small range
arr2 = [4, 2, 3, 4, 1, 2, 4]
print("\nSmall range array:", arr2)
result2 = counting_sort_range(arr2.copy(), 4)
print("After Counting Sort:", result2)

# Test 3: Duplicates
arr3 = [5, 2, 8, 2, 9, 1, 5, 5]
print("\nArray with duplicates:", arr3)
result3 = counting_sort(arr3.copy())
print("After Counting Sort:", result3)

# Test 4: Already sorted
arr4 = [1, 2, 3, 4, 5]
print("\nAlready sorted:", arr4)
result4 = counting_sort(arr4.copy())
print("After Counting Sort:", result4)

# Test 5: Reverse sorted
arr5 = [5, 4, 3, 2, 1]
print("\nReverse sorted:", arr5)
result5 = counting_sort(arr5.copy())
print("After Counting Sort:", result5)

# Test 6: Single element
arr6 = [42]
print("\nSingle element:", arr6)
result6 = counting_sort(arr6.copy())
print("After Counting Sort:", result6)

print("\nComplexity Analysis:")
print("Time Complexity: O(n + k) where k is range of input")
print("Space Complexity: O(k)")
print("Best Case: O(n + k)")
print("Worst Case: O(n + k)")
print("Average Case: O(n + k)")
print("Stable: Yes")
print("Note: Non-comparison, efficient for small ranges")
