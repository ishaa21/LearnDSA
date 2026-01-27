# Insertion in Doubly Linked List

## What is this?
Adding node in DLL. Must update 4 pointers (prev/next of NEW, prev/next of NEIGHBORS).

## Why do we need it?
- Bidirectional traversal support.

## Algorithm Logic
Update `prev` & `next` for new node and neighbors.

## Common Mistakes
- Missing one pointer update
- Broken chain

## Time Complexity
O(1) (at head)

## Space Complexity
O(1)

## Real Life Use
- Adding page to history

## Key Takeaways
- Careful pointer handling
- More complex than singly

## Recommended Problems
- Insert in Doubly Linked List (GFG)

## Mini Practice
### Problem: Insert Head
Insert 0 before 1 <-> 2.
Input: 1 <-> 2, Val 0
Output: 0 <-> 1 <-> 2
Hint: new.next=head; head.prev=new; head=new;
Solution: Update forward and backward links.
