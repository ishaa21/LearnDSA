# Detect Cycle in Doubly Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None

class CycleDetectionDLL:
    def __init__(self):
        self.head = None
    
    def add_node(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
            return
        temp = self.head
        while temp.next is not None:
            temp = temp.next
        temp.next = new_node
        new_node.prev = temp
    
    def detect_cycle_forward(self):
        if self.head is None:
            return False
        
        slow = self.head
        fast = self.head
        
        while fast is not None and fast.next is not None:
            slow = slow.next
            fast = fast.next.next
            
            if slow == fast:
                return True
        
        return False
    
    def detect_cycle_backward(self):
        if self.head is None:
            return False
        
        temp = self.head
        while temp.next is not None:
            temp = temp.next
        
        slow = self.head
        
        while temp is not None and slow is not None:
            if temp == slow:
                return True
            temp = temp.prev
            if temp is None:
                break
            if temp == slow:
                return True
            slow = slow.next
        
        return False

# Test
print("=== Detect Cycle in Doubly Linked List ===\n")

# Test 1: No cycle
list1 = CycleDetectionDLL()
list1.add_node(1)
list1.add_node(2)
list1.add_node(3)

print("List 1 (No cycle):", "Cycle detected" if list1.detect_cycle_forward() else "No cycle")

# Test 2: With cycle
list2 = CycleDetectionDLL()
n1 = Node(1)
n2 = Node(2)
n3 = Node(3)
n4 = Node(4)

n1.next = n2
n2.prev = n1
n2.next = n3
n3.prev = n2
n3.next = n4
n4.prev = n3
n4.next = n2
n2.prev = n4

list2.head = n1

print("List 2 (With cycle):", "Cycle detected" if list2.detect_cycle_forward() else "No cycle")

print("\nComplexity Analysis:")
print("Forward pointer detection: O(n) time, O(1) space")
print("Backward pointer detection: O(n) time, O(1) space")
