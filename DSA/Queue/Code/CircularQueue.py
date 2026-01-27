# Circular Queue in Python

class CircularQueue:
    def __init__(self, max_size=100):
        self.arr = [0] * max_size
        self.front = -1
        self.rear = -1
        self.size = 0
        self.max_size = max_size
    
    def is_empty(self):
        return self.size == 0
    
    def is_full(self):
        return self.size == self.max_size
    
    def enqueue(self, value):
        if self.is_full():
            print(f"Circular Queue overflow - cannot enqueue {value}")
            return
        if self.is_empty():
            self.front = 0
        self.rear = (self.rear + 1) % self.max_size
        self.arr[self.rear] = value
        self.size += 1
        print(f"Successfully enqueued: {value} (rear = {self.rear}, size = {self.size})")
    
    def dequeue(self):
        if self.is_empty():
            print("Circular Queue underflow - cannot dequeue")
            return -1
        value = self.arr[self.front]
        print(f"Successfully dequeued: {value} (front = {self.front}, size = {self.size - 1})")
        
        if self.size == 1:
            self.front = -1
            self.rear = -1
        else:
            self.front = (self.front + 1) % self.max_size
        self.size -= 1
        return value
    
    def peek(self):
        if self.is_empty():
            print("Circular Queue is empty - cannot peek")
            return -1
        print(f"Peeked: {self.arr[self.front]} (at front)")
        return self.arr[self.front]
    
    def display(self):
        if self.is_empty():
            print("Circular Queue is empty")
            return
        print("Circular Queue: ", end="")
        i = self.front
        for count in range(self.size):
            print(self.arr[i], end=" ")
            i = (i + 1) % self.max_size
        print()

# Test
q = CircularQueue()

print("=== Circular Queue ===\n")

q.display()

print("\nEnqueuing elements:")
for i in range(1, 6):
    q.enqueue(i * 10)

q.display()

print("\nDequeuing 2 elements:")
q.dequeue()
q.dequeue()

q.display()

print("\nEnqueuing 2 more elements (circular reuse):")
q.enqueue(100)
q.enqueue(200)

q.display()

print("\nComplexity Analysis:")
print("Enqueue: O(1)")
print("Dequeue: O(1)")
print("Peek: O(1)")
print("Space: O(n)")
print("Advantage: Efficient space reuse in circular manner")
