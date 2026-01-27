# Searching in Arrays in Python
# Linear Search and Binary Search implementations

# Linear Search
def linear_search(arr, target):
    for i in range(len(arr)):
        if arr[i] == target:
            return i
    return -1

# Binary Search
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = left + (right - left) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1

# Using Python's built-in search
def search_using_builtin(arr, target):
    if target in arr:
        return arr.index(target)
    return -1

arr = [10, 20, 30, 40, 50, 60, 70]

# Linear Search
target = 40
print(f"Linear Search for {target}: ", end="")
pos = linear_search(arr, target)
if pos != -1:
    print(f"Found at index {pos}")
else:
    print("Not found")

# Linear Search for non-existing element
target = 25
print(f"Linear Search for {target}: ", end="")
pos = linear_search(arr, target)
if pos != -1:
    print(f"Found at index {pos}")
else:
    print("Not found")

# Binary Search
target = 50
print(f"Binary Search for {target}: ", end="")
pos = binary_search(arr, target)
if pos != -1:
    print(f"Found at index {pos}")
else:
    print("Not found")

# Using built-in method
target = 30
print(f"Using built-in for {target}: ", end="")
pos = search_using_builtin(arr, target)
if pos != -1:
    print(f"Found at index {pos}")
else:
    print("Not found")
