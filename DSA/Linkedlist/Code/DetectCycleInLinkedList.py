# Detect Cycle in Linked List in Python

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class CycleDetection:
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
    
    # Floyd's Cycle Detection (Tortoise & Hare)
    def detect_cycle_floyd(self):
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
    
    # Hash Set approach
    def detect_cycle_hash_set(self):
        visited = set()
        temp = self.head
        
        while temp is not None:
            if id(temp) in visited:
                return True
            visited.add(id(temp))
            temp = temp.next
        
        return False
    
    # Find cycle start node
    def find_cycle_start(self):
        if self.head is None:
            return None
        
        slow = self.head
        fast = self.head
        
        # Detect cycle
        while fast is not None and fast.next is not None:
            slow = slow.next
            fast = fast.next.next
            
            if slow == fast:
                break
        
        if fast is None or fast.next is None:
            return None
        
        # Find cycle start
        slow = self.head
        while slow != fast:
            slow = slow.next
            fast = fast.next
        
        return slow

# Test
print("=== Detect Cycle in Linked List ===\n")

# Test 1: No cycle
list1 = CycleDetection()
list1.add_node(1)
list1.add_node(2)
list1.add_node(3)
list1.add_node(4)

print("List 1 (No cycle):", "Cycle detected" if list1.detect_cycle_floyd() else "No cycle")

# Test 2: With cycle
list2 = CycleDetection()
n1 = Node(1)
n2 = Node(2)
n3 = Node(3)
n4 = Node(4)

n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n2  # Creates cycle

list2.head = n1

print("List 2 (With cycle):", "Cycle detected" if list2.detect_cycle_floyd() else "No cycle")

cycle_start = list2.find_cycle_start()
if cycle_start is not None:
    print(f"Cycle starts at node with data: {cycle_start.data}")

print("\nComplexity Analysis:")
print("Floyd's Cycle Detection: O(n) time, O(1) space")
print("Hash Set approach: O(n) time, O(n) space")
print("Find Cycle Start: O(n) time, O(1) space")
