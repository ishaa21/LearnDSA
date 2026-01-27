def binary_search(arr, target):
    low = 0
    high = len(arr) - 1

    while low <= high:
        mid = (low + high) // 2
        
        # Check if target is at mid
        if arr[mid] == target:
            return mid
        
        # If target is greater, ignore left half
        elif arr[mid] < target:
            low = mid + 1
            
        # If target is smaller, ignore right half
        else:
            high = mid - 1
            
    # Target was not found
    return -1

# Driver Code
numbers = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
target = 23

result = binary_search(numbers, target)
if result != -1:
    print(f"Element found at index {result}")
else:
    print("Element not found")
