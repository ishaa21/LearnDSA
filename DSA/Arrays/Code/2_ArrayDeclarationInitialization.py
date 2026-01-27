# Array Declaration & Initialization in Python
# Different ways to create and initialize lists (arrays)

# Method 1: List with initialization
arr1 = [1, 2, 3, 4, 5]
print("arr1:", arr1)

# Method 2: Empty list
arr2 = []
print("arr2 (empty):", arr2)

# Method 3: List with repeated elements
arr3 = [0] * 5
print("arr3 (repeated):", arr3)

# Method 4: List comprehension
arr4 = [i for i in range(1, 6)]
print("arr4 (list comprehension):", arr4)

# Method 5: Using range
arr5 = list(range(10, 50, 10))
print("arr5 (using range):", arr5)

# Method 6: 2D list initialization
arr6 = [[0 for _ in range(3)] for _ in range(3)]
print("arr6 (2D list):", arr6)

# Method 7: String to list conversion
arr7 = list("hello")
print("arr7 (string to list):", arr7)

# Method 8: Adding elements after creation
arr8 = []
arr8.append(10)
arr8.extend([20, 30, 40])
print("arr8 (after append/extend):", arr8)
