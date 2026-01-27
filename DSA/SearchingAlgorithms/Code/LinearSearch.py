# Linear Search in Python
# Search for an element by checking each element sequentially

def linear_search(arr, target):
    """Linear search - returns index or -1 if not found"""
    for i in range(len(arr)):
        if arr[i] == target:
            return i
    return -1

def linear_search_all(arr, target):
    """Find all occurrences of target"""
    indices = []
    for i in range(len(arr)):
        if arr[i] == target:
            indices.append(i)
    return indices

def linear_search_with_count(arr, target):
    """Linear search with occurrence count"""
    count = 0
    for element in arr:
        if element == target:
            count += 1
    return count

# Test 1: Basic linear search
arr = [64, 34, 25, 12, 22, 11, 90]
print("Array:", arr)

target = 22
print(f"\nSearching for {target}: ", end="")
result = linear_search(arr, target)
if result != -1:
    print(f"Found at index {result}")
else:
    print("Not found")

# Test 2: Search for existing element at beginning
target = 64
print(f"Searching for {target}: ", end="")
result = linear_search(arr, target)
if result != -1:
    print(f"Found at index {result}")
else:
    print("Not found")

# Test 3: Search for non-existing element
target = 100
print(f"Searching for {target}: ", end="")
result = linear_search(arr, target)
if result != -1:
    print(f"Found at index {result}")
else:
    print("Not found")

# Test 4: Find all occurrences
arr2 = [10, 20, 30, 20, 40, 20]
print(f"\nArray 2: {arr2}")
target = 20
indices = linear_search_all(arr2, target)
print(f"All occurrences of {target}: {indices}")

# Test 5: Count occurrences
target = 20
count = linear_search_with_count(arr2, target)
print(f"Count of {target}: {count}")

# Using Python built-in methods
print(f"\nUsing built-in methods:")
print(f"20 in arr2: {20 in arr2}")
print(f"Index of 20: {arr2.index(20)}")
print(f"Count of 20: {arr2.count(20)}")

# Complexity Analysis
print("\nComplexity Analysis:")
print("Time Complexity: O(n) - Linear")
print("Space Complexity: O(1) - Constant")
print("Best Case: O(1) - Element at first position")
print("Worst Case: O(n) - Element at last position or not found")
print("Average Case: O(n/2) = O(n)")
