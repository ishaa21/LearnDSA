# Array Traversal in Python
# Accessing and processing each element of a list

arr = [10, 20, 30, 40, 50]

# Method 1: Forward traversal using for loop with index
print("Forward traversal with index:")
for i in range(len(arr)):
    print(f"arr[{i}] = {arr[i]}")

# Method 2: Forward traversal without index
print("\nForward traversal (direct):")
for val in arr:
    print(f"Value: {val}")

# Method 3: Backward traversal
print("\nBackward traversal:")
for i in range(len(arr) - 1, -1, -1):
    print(f"arr[{i}] = {arr[i]}")

# Method 4: Using enumerate
print("\nUsing enumerate:")
for index, value in enumerate(arr):
    print(f"Index: {index}, Value: {value}")

# Method 5: Using reversed()
print("\nUsing reversed():")
for val in reversed(arr):
    print(f"Value: {val}")

# Method 6: Calculate sum during traversal
total = sum(arr)
print(f"\nSum of all elements: {total}")

# Method 7: Apply operation to each element
print("\nDouble each element:")
doubled = [x * 2 for x in arr]
print(doubled)

# Method 8: Calculate product
product = 1
for val in arr:
    product *= val
print(f"Product of all elements: {product}")
