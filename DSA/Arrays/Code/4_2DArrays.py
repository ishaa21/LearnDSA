# 2D Arrays in Python
# 2D arrays/lists are matrix-like structures with rows and columns

# Declaration and initialization
arr = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Accessing elements
print("Element at [0][0]:", arr[0][0])
print("Element at [1][2]:", arr[1][2])
print("Element at [2][1]:", arr[2][1])

# Iterating through 2D array and printing
print("2D Array:")
for i in range(len(arr)):
    for j in range(len(arr[i])):
        print(arr[i][j], end=" ")
    print()

# Modifying element
arr[1][1] = 10
print("After modification, arr[1][1] =", arr[1][1])

# Calculating sum of all elements
total = 0
for i in range(len(arr)):
    for j in range(len(arr[i])):
        total += arr[i][j]
print("Sum of all elements:", total)

# Using list comprehension for creating 2D array
matrix = [[i + j for j in range(3)] for i in range(3)]
print("Matrix created with list comprehension:", matrix)
