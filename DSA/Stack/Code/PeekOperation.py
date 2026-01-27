# Peek Operation in Python

class Stack:
    def __init__(self, max_size=100):
        self.arr = [0] * max_size
        self.top = -1
        self.max_size = max_size
    
    def is_empty(self):
        return self.top == -1
    
    def push(self, value):
        self.top += 1
        self.arr[self.top] = value
    
    def peek(self):
        if self.is_empty():
            print("Stack is empty - cannot peek")
            return -1
        print(f"Peeked: {self.arr[self.top]} (at position {self.top})")
        return self.arr[self.top]
    
    def display(self):
        if self.is_empty():
            print("Stack is empty")
            return
        print("Current stack: ", end="")
        for i in range(self.top + 1):
            print(self.arr[i], end=" ")
        print()

# Test
stack = Stack()

print("=== Peek Operation ===\n")

stack.peek()

print("\nPushing elements:")
for i in range(1, 6):
    stack.push(i * 10)

stack.display()

print("\nPeeking without removing:")
for i in range(3):
    stack.peek()

stack.display()

print("\nComplexity Analysis:")
print("Time: O(1)")
print("Space: O(1)")
