# Deque (Double Ended Queue) in Python

class Deque:
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
    
    def insert_front(self, value):
        if self.is_full():
            print("Deque overflow - cannot insert at front")
            return
        if self.is_empty():
            self.front = 0
            self.rear = 0
        else:
            self.front = (self.front - 1 + self.max_size) % self.max_size
        self.arr[self.front] = value
        self.size += 1
        print(f"Successfully inserted at front: {value} (size = {self.size})")
    
    def insert_rear(self, value):
        if self.is_full():
            print("Deque overflow - cannot insert at rear")
            return
        if self.is_empty():
            self.front = 0
            self.rear = 0
        else:
            self.rear = (self.rear + 1) % self.max_size
        self.arr[self.rear] = value
        self.size += 1
        print(f"Successfully inserted at rear: {value} (size = {self.size})")
    
    def delete_front(self):
        if self.is_empty():
            print("Deque underflow - cannot delete from front")
            return -1
        value = self.arr[self.front]
        print(f"Successfully deleted from front: {value} (size = {self.size - 1})")
        
        if self.size == 1:
            self.front = -1
            self.rear = -1
        else:
            self.front = (self.front + 1) % self.max_size
        self.size -= 1
        return value
    
    def delete_rear(self):
        if self.is_empty():
            print("Deque underflow - cannot delete from rear")
            return -1
        value = self.arr[self.rear]
        print(f"Successfully deleted from rear: {value} (size = {self.size - 1})")
        
        if self.size == 1:
            self.front = -1
            self.rear = -1
        else:
            self.rear = (self.rear - 1 + self.max_size) % self.max_size
        self.size -= 1
        return value
    
    def display(self):
        if self.is_empty():
            print("Deque is empty")
            return
        print("Deque: ", end="")
        i = self.front
        for count in range(self.size):
            print(self.arr[i], end=" ")
            i = (i + 1) % self.max_size
        print()

# Test
d = Deque()

print("=== Deque (Double Ended Queue) ===\n")

d.display()

print("\nInserting at rear:")
for i in range(1, 4):
    d.insert_rear(i * 10)

d.display()

print("\nInserting at front:")
d.insert_front(5)
d.insert_front(2)

d.display()

print("\nDeleting from front:")
d.delete_front()

print("\nDeleting from rear:")
d.delete_rear()

d.display()

print("\nComplexity Analysis:")
print("Insert Front: O(1)")
print("Insert Rear: O(1)")
print("Delete Front: O(1)")
print("Delete Rear: O(1)")
print("Space: O(n)")
print("Advantage: Flexible insertion/deletion from both ends")
