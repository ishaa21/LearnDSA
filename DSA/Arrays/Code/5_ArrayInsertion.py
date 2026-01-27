# Array Insertion in Python
# Insert an element at a specific position in a list

arr = [10, 20, 30, 40, 50]

print("Original array:", arr)

# Method 1: Insert at beginning using insert()
arr.insert(0, 5)
print("After inserting 5 at beginning:", arr)

# Method 2: Insert at middle position
arr.insert(3, 25)
print("After inserting 25 at position 3:", arr)

# Method 3: Insert at end
arr.insert(len(arr), 60)
print("After inserting 60 at end:", arr)

# Method 4: Append at end
arr.append(70)
print("After appending 70:", arr)

# Method 5: Insert multiple elements using extend
arr2 = [100, 200, 300]
arr.extend(arr2)
print("After extending with [100, 200, 300]:", arr)

# Method 6: Insert using slicing
arr3 = [10, 20, 30, 40, 50]
arr3 = arr3[:2] + [999] + arr3[2:]
print("Inserted 999 at position 2 using slicing:", arr3)

# Custom insertion function
def insert_element(lst, position, value):
    """Insert element at specific position"""
    lst.insert(position, value)
    return lst

arr4 = [1, 2, 3, 4, 5]
insert_element(arr4, 2, 99)
print("Using custom function:", arr4)
