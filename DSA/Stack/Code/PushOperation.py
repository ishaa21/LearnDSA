# Push Operation in Python

class Stack:
    def __init__(self, max_size=100):
        self.arr = [0] * max_size
        self.top = -1
        self.max_size = max_size
    
    def is_full(self):
        return self.top == self.max_size - 1
    
    def push(self, value):
        if self.is_full():
            print(f"Stack overflow - cannot push {value}")
            return
        self.top += 1
        self.arr[self.top] = value
        print(f"Successfully pushed: {value} (top = {self.top})")
    
    def display(self):
        if self.top == -1:
            print("Stack is empty")
            return
        print("Current stack: ", end="")
        for i in range(self.top + 1):
            print(self.arr[i], end=" ")
        print()

# Test
stack = Stack()

print("=== Push Operation ===\n")

stack.display()

for i in range(1, 6):
    stack.push(i * 10)

stack.display()

print("\nComplexity Analysis:")
print("Time: O(1)")
print("Space: O(1)")
