# Array Deletion in Python
# Remove an element from a specific position in a list

arr = [10, 20, 30, 40, 50]

print("Original array:", arr)

# Method 1: Delete using del statement
arr1 = [10, 20, 30, 40, 50]
del arr1[0]
print("After deleting first element (del):", arr1)

# Method 2: Delete using pop()
arr2 = [10, 20, 30, 40, 50]
removed = arr2.pop(0)
print("After popping first element (pop):", arr2)
print("Removed element:", removed)

# Method 3: Delete from middle
arr3 = [10, 20, 30, 40, 50]
arr3.pop(2)
print("After deleting element at position 2:", arr3)

# Method 4: Delete from end
arr4 = [10, 20, 30, 40, 50]
arr4.pop()
print("After deleting last element:", arr4)

# Method 5: Delete using remove() - removes by value
arr5 = [10, 20, 30, 40, 50]
arr5.remove(30)
print("After removing value 30:", arr5)

# Method 6: Delete multiple elements
arr6 = [10, 20, 30, 40, 50]
del arr6[1:3]  # Delete elements from index 1 to 2
print("After deleting elements from index 1 to 2:", arr6)

# Method 7: Filter out elements
arr7 = [10, 20, 30, 40, 50]
arr7 = [x for x in arr7 if x != 30]
print("After filtering out 30:", arr7)
