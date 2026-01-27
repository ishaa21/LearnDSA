# Heapify in Python

class Heapify:
    @staticmethod
    def swap(arr, i, j):
        arr[i], arr[j] = arr[j], arr[i]
    
    @staticmethod
    def left_child(i):
        return 2 * i + 1
    
    @staticmethod
    def right_child(i):
        return 2 * i + 2
    
    @staticmethod
    def min_heapify(arr, n, i):
        smallest = i
        left = Heapify.left_child(i)
        right = Heapify.right_child(i)
        
        if left < n and arr[left] < arr[smallest]:
            smallest = left
        if right < n and arr[right] < arr[smallest]:
            smallest = right
        
        if smallest != i:
            Heapify.swap(arr, i, smallest)
            Heapify.min_heapify(arr, n, smallest)
    
    @staticmethod
    def max_heapify(arr, n, i):
        largest = i
        left = Heapify.left_child(i)
        right = Heapify.right_child(i)
        
        if left < n and arr[left] > arr[largest]:
            largest = left
        if right < n and arr[right] > arr[largest]:
            largest = right
        
        if largest != i:
            Heapify.swap(arr, i, largest)
            Heapify.max_heapify(arr, n, largest)
    
    @staticmethod
    def build_min_heap(arr):
        n = len(arr)
        for i in range(n // 2 - 1, -1, -1):
            Heapify.min_heapify(arr, n, i)
    
    @staticmethod
    def build_max_heap(arr):
        n = len(arr)
        for i in range(n // 2 - 1, -1, -1):
            Heapify.max_heapify(arr, n, i)

# Test
print("=== Heapify (Python) ===\n")

arr1 = [4, 10, 3, 5, 1, 2, 8]
print("Original Array:", arr1)

print("\nBuilding Min Heap:")
Heapify.build_min_heap(arr1)
print("Min Heap:", arr1)

arr2 = [4, 10, 3, 5, 1, 2, 8]
print("\nBuilding Max Heap:")
Heapify.build_max_heap(arr2)
print("Max Heap:", arr2)

print("\n=== Heapify Algorithm ===")
print("1. Start from last non-leaf node (index n/2 - 1)")
print("2. Call heapify for each node from bottom to top")
print("3. Heapify moves element down to correct position")
print("4. Recursively heapify affected subtrees\n")

print("=== Heapify Complexity ===")
print("Time Complexity:  O(n)")
print("Space Complexity: O(log n) for recursion")
print("Applications: Heap Sort, Priority Queue construction")
