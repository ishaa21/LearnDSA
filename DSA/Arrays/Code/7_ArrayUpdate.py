# Array Update in Python
# Modify/Update elements at specific positions

arr = [10, 20, 30, 40, 50]

print("Original array:", arr)

# Method 1: Direct update by index
arr[0] = 15
print("After updating index 0 to 15:", arr)

# Method 2: Update multiple elements
arr[2] = 35
arr[4] = 55
print("After updating indices 2 and 4:", arr)

# Method 3: Conditional update
arr = [10, 20, 30, 40, 50]
for i in range(len(arr)):
    if arr[i] > 20:
        arr[i] *= 2
print("After doubling elements > 20:", arr)

# Method 4: Update all elements by adding a value
arr = [10, 20, 30, 40, 50]
addValue = 5
for i in range(len(arr)):
    arr[i] += addValue
print("After adding 5 to all elements:", arr)

# Method 5: Update using list comprehension
arr = [10, 20, 30, 40, 50]
arr = [x * 2 for x in arr]
print("After doubling all elements (comprehension):", arr)

# Method 6: Update specific range
arr = [10, 20, 30, 40, 50]
arr[1:4] = [99, 99, 99]
print("After updating range [1:4] to 99:", arr)

# Method 7: Using function to update
def update_element(lst, index, value):
    lst[index] = value
    return lst

arr = [10, 20, 30, 40, 50]
update_element(arr, 2, 100)
print("After using function to update index 2:", arr)
