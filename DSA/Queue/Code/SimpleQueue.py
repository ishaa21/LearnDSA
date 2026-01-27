# Simple Queue in Python

class Queue:
    def __init__(self, max_size=100):
        self.arr = [0] * max_size
        self.front = -1
        self.rear = -1
        self.max_size = max_size
    
    def is_empty(self):
        return self.front == -1
    
    def is_full(self):
        return self.rear == self.max_size - 1
    
    def enqueue(self, value):
        if self.is_full():
            print(f"Queue overflow - cannot enqueue {value}")
            return
        if self.is_empty():
            self.front = 0
        self.rear += 1
        self.arr[self.rear] = value
        print(f"Successfully enqueued: {value} (rear = {self.rear})")
    
    def dequeue(self):
        if self.is_empty():
            print("Queue underflow - cannot dequeue")
            return -1
        value = self.arr[self.front]
        print(f"Successfully dequeued: {value} (front = {self.front})")
        
        if self.front == self.rear:
            self.front = -1
            self.rear = -1
        else:
            self.front += 1
        return value
    
    def peek(self):
        if self.is_empty():
            print("Queue is empty - cannot peek")
            return -1
        print(f"Peeked: {self.arr[self.front]} (at front)")
        return self.arr[self.front]
    
    def display(self):
        if self.is_empty():
            print("Queue is empty")
            return
        print("Queue: ", end="")
        for i in range(self.front, self.rear + 1):
            print(self.arr[i], end=" ")
        print()

# Test
q = Queue()

print("=== Simple Queue ===\n")

q.display()

print("\nEnqueuing elements:")
for i in range(1, 6):
    q.enqueue(i * 10)

q.display()

print("\nDequeuing 2 elements:")
q.dequeue()
q.dequeue()

q.display()

print("\nComplexity Analysis:")
print("Enqueue: O(1)")
print("Dequeue: O(1)")
print("Peek: O(1)")
print("Space: O(n)")
