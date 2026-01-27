# Stack Implementation using Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class Stack:
    def __init__(self):
        self.top = None
    
    def is_empty(self):
        return self.top is None
    
    def push(self, value):
        new_node = Node(value)
        new_node.next = self.top
        self.top = new_node
        print(f"Pushed: {value}")
    
    def pop(self):
        if self.is_empty():
            print("Stack underflow")
            return -1
        value = self.top.data
        self.top = self.top.next
        return value
    
    def peek(self):
        if self.is_empty():
            print("Stack is empty")
            return -1
        return self.top.data
    
    def display(self):
        if self.is_empty():
            print("Stack is empty")
            return
        
        print("Stack: ", end="")
        temp = self.top
        while temp is not None:
            print(f"{temp.data} -> ", end="")
            temp = temp.next
        print("NULL")

# Test
stack = Stack()

print("=== Stack Implementation (Linked List) ===\n")

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
