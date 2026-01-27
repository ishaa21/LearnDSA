# Max Heap in Python

class MaxHeap:
    def __init__(self):
        self.arr = []
    
    def parent(self, i):
        return (i - 1) // 2
    
    def left_child(self, i):
        return 2 * i + 1
    
    def right_child(self, i):
        return 2 * i + 2
    
    def swap(self, i, j):
        self.arr[i], self.arr[j] = self.arr[j], self.arr[i]
    
    def heapify_up(self, i):
        while i > 0 and self.arr[self.parent(i)] < self.arr[i]:
            self.swap(i, self.parent(i))
            i = self.parent(i)
    
    def heapify_down(self, i):
        largest = i
        left = self.left_child(i)
        right = self.right_child(i)
        
        if left < len(self.arr) and self.arr[left] > self.arr[largest]:
            largest = left
        if right < len(self.arr) and self.arr[right] > self.arr[largest]:
            largest = right
        
        if largest != i:
            self.swap(i, largest)
            self.heapify_down(largest)
    
    def insert(self, key):
        self.arr.append(key)
        self.heapify_up(len(self.arr) - 1)
    
    def extract_max(self):
        if not self.arr:
            return -1
        
        max_val = self.arr[0]
        self.arr[0] = self.arr[-1]
        self.arr.pop()
        
        if self.arr:
            self.heapify_down(0)
        
        return max_val
    
    def get_max(self):
        return self.arr[0] if self.arr else -1
    
    def print_heap(self):
        print("Max Heap (Array):", self.arr)

# Test
print("=== Max Heap (Python) ===\n")

heap = MaxHeap()

print("Inserting: 5, 10, 3, 2, 8, 1")
heap.insert(5)
heap.insert(10)
heap.insert(3)
heap.insert(2)
heap.insert(8)
heap.insert(1)

heap.print_heap()

print("\nExtracting maximum elements:")
print(f"Extract: {heap.extract_max()}")
heap.print_heap()
print(f"Extract: {heap.extract_max()}")
heap.print_heap()

print("\n=== Max Heap Properties ===")
print("1. Parent >= Left Child")
print("2. Parent >= Right Child")
print("3. Complete binary tree (all levels filled except last)")
print("4. Maximum element always at root\n")

print("=== Max Heap Complexity ===")
print("Insert:      O(log n)")
print("Extract Max: O(log n)")
print("Get Max:     O(1)")
print("Space:       O(n)")
