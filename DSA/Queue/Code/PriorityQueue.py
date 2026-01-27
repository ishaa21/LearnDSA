# Priority Queue in Python

class Element:
    def __init__(self, data, priority):
        self.data = data
        self.priority = priority

class PriorityQueue:
    def __init__(self):
        self.arr = []
    
    def is_empty(self):
        return len(self.arr) == 0
    
    def is_full(self):
        return len(self.arr) == 100
    
    def enqueue(self, data, priority):
        if self.is_full():
            print("Priority Queue overflow")
            return
        
        elem = Element(data, priority)
        i = len(self.arr) - 1
        self.arr.append(elem)
        
        while i >= 0 and self.arr[i].priority < priority:
            self.arr[i + 1] = self.arr[i]
            i -= 1
        self.arr[i + 1] = elem
        
        print(f"Enqueued: data={data}, priority={priority} (size={len(self.arr)})")
    
    def dequeue(self):
        if self.is_empty():
            print("Priority Queue underflow")
            return -1
        data = self.arr[0].data
        print(f"Dequeued: data={data}, priority={self.arr[0].priority} (size={len(self.arr) - 1})")
        
        self.arr.pop(0)
        return data
    
    def display(self):
        if self.is_empty():
            print("Priority Queue is empty")
            return
        print("Priority Queue (data -> priority):")
        for elem in self.arr:
            print(f"  {elem.data} -> {elem.priority}")

# Test
pq = PriorityQueue()

print("=== Priority Queue ===\n")

pq.display()

print("\nEnqueuing elements:")
pq.enqueue(10, 2)
pq.enqueue(20, 5)
pq.enqueue(30, 1)
pq.enqueue(40, 3)

pq.display()

print("\nDequeuing (highest priority first):")
pq.dequeue()
pq.dequeue()

pq.display()

print("\nComplexity Analysis:")
print("Enqueue: O(n) - insertion in sorted order")
print("Dequeue: O(n) - removal with shifting")
print("Peek: O(1)")
print("Space: O(n)")
print("Note: Using linked list or heap improves Enqueue to O(log n)")
