# Sorting in Arrays in Python
# Bubble Sort, Selection Sort, and built-in sort

# Bubble Sort
def bubble_sort(arr):
    n = len(arr)
    for i in range(n - 1):
        for j in range(n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

# Selection Sort
def selection_sort(arr):
    n = len(arr)
    for i in range(n - 1):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    return arr

# Insertion Sort
def insertion_sort(arr):
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    return arr

arr = [64, 34, 25, 12, 22, 11, 90]

print("Original array:", arr)

# Bubble Sort
arr1 = arr.copy()
bubble_sort(arr1)
print("After Bubble Sort:", arr1)

# Selection Sort
arr2 = arr.copy()
selection_sort(arr2)
print("After Selection Sort:", arr2)

# Insertion Sort
arr3 = arr.copy()
insertion_sort(arr3)
print("After Insertion Sort:", arr3)

# Using Python's built-in sort
arr4 = arr.copy()
arr4.sort()
print("Using built-in sort():", arr4)

# Using sorted() function
arr5 = sorted(arr)
print("Using sorted():", arr5)

# Sort in reverse order
arr6 = sorted(arr, reverse=True)
print("Sorted in reverse:", arr6)
