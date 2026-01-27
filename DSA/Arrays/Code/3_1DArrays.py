# 1D Arrays in Python
# Single dimensional arrays/lists store elements linearly

# Declaration and initialization
arr = [10, 20, 30, 40, 50]

# Accessing elements
print("Element at index 0:", arr[0])
print("Element at index 2:", arr[2])

# Modifying elements
arr[1] = 25
print("Modified element at index 1:", arr[1])

# Iterating and printing all elements
print("All elements:", arr)

# Finding sum
total = sum(arr)
print("Sum of all elements:", total)

# Finding maximum and minimum
print("Maximum element:", max(arr))
print("Minimum element:", min(arr))

# Array operations
arr.append(60)  # Add element at end
print("After appending 60:", arr)

arr.insert(2, 35)  # Insert at specific index
print("After inserting 35 at index 2:", arr)
