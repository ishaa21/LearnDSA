# Radix Sort in Python
# Sorts by processing individual digits

def counting_sort_for_radix(arr, exp):
    """Counting sort for radix sort"""
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

def radix_sort(arr):
    """Radix sort for non-negative integers"""
    if not arr:
        return arr
    
    max_val = max(arr)
    exp = 1
    
    while max_val // exp > 0:
        arr = counting_sort_for_radix(arr, exp)
        exp *= 10
    
    return arr

def radix_sort_strings(arr):
    """Radix sort for strings (character by character from right)"""
    if not arr:
        return arr
    
    max_len = max(len(s) for s in arr)
    
    for i in range(max_len - 1, -1, -1):
        arr = sorted(arr, key=lambda x: x[i] if i < len(x) else '\0')
    
    return arr

# Test 1: Basic radix sort
arr = [170, 45, 75, 90, 2, 802, 24, 2, 66]
print("Original Array:", arr)
result = radix_sort(arr.copy())
print("Sorted Array:", result)

# Test 2: Single digit
arr2 = [5, 2, 8, 3, 9, 1, 4]
print("\nSingle digit array:", arr2)
result2 = radix_sort(arr2.copy())
print("After Radix Sort:", result2)

# Test 3: Duplicates
arr3 = [50, 25, 85, 25, 90, 10, 50, 50]
print("\nArray with duplicates:", arr3)
result3 = radix_sort(arr3.copy())
print("After Radix Sort:", result3)

# Test 4: Already sorted
arr4 = [10, 20, 30, 40, 50]
print("\nAlready sorted:", arr4)
result4 = radix_sort(arr4.copy())
print("After Radix Sort:", result4)

# Test 5: Reverse sorted
arr5 = [500, 400, 300, 200, 100]
print("\nReverse sorted:", arr5)
result5 = radix_sort(arr5.copy())
print("After Radix Sort:", result5)

# Test 6: Large numbers
arr6 = [170000, 45000, 75000, 90000, 2000, 802000, 24000, 2000, 66000]
print("\nLarge numbers:", arr6)
result6 = radix_sort(arr6.copy())
print("After Radix Sort:", result6)

print("\nComplexity Analysis:")
print("Time Complexity: O(d * (n + k)) where d is number of digits")
print("Space Complexity: O(n + k)")
print("Best Case: O(d * n)")
print("Worst Case: O(d * (n + k))")
print("Average Case: O(d * (n + k))")
print("Stable: Yes")
print("Note: Works best for positive integers, efficient for large datasets")
