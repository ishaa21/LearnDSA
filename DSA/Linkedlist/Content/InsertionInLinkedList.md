# Insertion in Linked List

## What is this?
Adding a new node to the list.

## Why do we need it?
- To grow list dynamically.

## Algorithm Logic
1. Create new node
2. Update next pointers
3. If inserting at head, update head

## Common Mistakes
- Wrong pointer linking (Losing the rest of the list)

## Time Complexity
- At head: O(1)
- At position: O(n)

## Space Complexity
O(1)

## Real Life Use
- Adding a new train car
- Adding items to checklist

## Key Takeaways
- Pointer updates are crucial
- Order of update matters

## Mini Practice
### Problem: Insert at Head
Insert 5 at head of 10 -> 20.
Input: List: 10 -> 20. Val: 5.
Output: 5 -> 10 -> 20.
Hint: NewNode.next = head; head = NewNode.
Solution: node.next = head; head = node;

### Problem: Insert at End
Insert 40 at the end of linked list: 10 -> 20 -> 30.
Input: 10->20->30, Insert 40 at end
Output: 10->20->30->40
Hint: Traverse to the last node, then set last.next = newNode.
Solution: curr=head; while curr.next: curr=curr.next; curr.next = Node(40)

### Problem: Insert at Position
Insert 25 at position 2 in: 10 -> 20 -> 30.
Input: 10->20->30, Insert 25 at position 2
Output: 10->20->25->30
Hint: Traverse to position-1, insert new node by updating links.
Solution: Traverse to node at index 1. newNode.next = curr.next; curr.next = newNode.
