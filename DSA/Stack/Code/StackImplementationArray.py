# Stack Implementation using Array in Python

class Stack:
    def __init__(self, max_size=100):
        self.arr = [0] * max_size
        self.top = -1
        self.max_size = max_size
    
    def is_full(self):
        return self.top == self.max_size - 1
    
    def is_empty(self):
        return self.top == -1
    
    def push(self, value):
        if self.is_full():
            print("Stack overflow")
            return
        self.top += 1
        self.arr[self.top] = value
        print(f"Pushed: {value}")
    
    def pop(self):
        if self.is_empty():
            print("Stack underflow")
            return -1
        value = self.arr[self.top]
        self.top -= 1
        return value
    
    def peek(self):
        if self.is_empty():
            print("Stack is empty")
            return -1
        return self.arr[self.top]
    
    def display(self):
        if self.is_empty():
            print("Stack is empty")
            return
        
        print("Stack: ", end="")
        for i in range(self.top + 1):
            print(self.arr[i], end=" ")
        print()

# Test
stack = Stack()

print("=== Stack Implementation (Array) ===\n")

stack.push(10)
stack.push(20)
stack.push(30)
stack.push(40)

stack.display()

print(f"\nPeek: {stack.peek()}")

print(f"\nPopped: {stack.pop()}")
print(f"Popped: {stack.pop()}")

stack.display()

print("\nComplexity Analysis:")
print("Push: O(1)")
print("Pop: O(1)")
print("Peek: O(1)")
print("Space: O(n)")
