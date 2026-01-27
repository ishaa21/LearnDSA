# Min Heap in Python

class MinHeap:
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
        while i > 0 and self.arr[self.parent(i)] > self.arr[i]:
            self.swap(i, self.parent(i))
            i = self.parent(i)
    
    def heapify_down(self, i):
        smallest = i
        left = self.left_child(i)
        right = self.right_child(i)
        
        if left < len(self.arr) and self.arr[left] < self.arr[smallest]:
            smallest = left
        if right < len(self.arr) and self.arr[right] < self.arr[smallest]:
            smallest = right
        
        if smallest != i:
            self.swap(i, smallest)
            self.heapify_down(smallest)
    
    def insert(self, key):
        self.arr.append(key)
        self.heapify_up(len(self.arr) - 1)
    
    def extract_min(self):
        if not self.arr:
            return -1
        
        min_val = self.arr[0]
        self.arr[0] = self.arr[-1]
        self.arr.pop()
        
        if self.arr:
            self.heapify_down(0)
        
        return min_val
    
    def get_min(self):
        return self.arr[0] if self.arr else -1
    
    def print_heap(self):
        print("Min Heap (Array):", self.arr)

# Test
print("=== Min Heap (Python) ===\n")

heap = MinHeap()

print("Inserting: 10, 5, 3, 2, 8, 1")
heap.insert(10)
heap.insert(5)
heap.insert(3)
heap.insert(2)
heap.insert(8)
heap.insert(1)

heap.print_heap()

print("\nExtracting minimum elements:")
print(f"Extract: {heap.extract_min()}")
heap.print_heap()
print(f"Extract: {heap.extract_min()}")
heap.print_heap()

print("\n=== Min Heap Properties ===")
print("1. Parent <= Left Child")
print("2. Parent <= Right Child")
print("3. Complete binary tree (all levels filled except last)")
print("4. Minimum element always at root\n")

print("=== Min Heap Complexity ===")
print("Insert:      O(log n)")
print("Extract Min: O(log n)")
print("Get Min:     O(1)")
print("Space:       O(n)")
