# Pop Operation in Python

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
    
    def pop(self):
        if self.is_empty():
            print("Stack underflow - cannot pop")
            return -1
        value = self.arr[self.top]
        print(f"Successfully popped: {value} (top = {self.top - 1})")
        self.top -= 1
        return value
    
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

print("=== Pop Operation ===\n")

for i in range(1, 6):
    stack.push(i * 10)

stack.display()

print("\nPopping elements:")
stack.pop()
stack.pop()

stack.display()

print("\nPopping all remaining:")
while not stack.is_empty():
    stack.pop()

stack.display()
stack.pop()

print("\nComplexity Analysis:")
print("Time: O(1)")
print("Space: O(1)")
