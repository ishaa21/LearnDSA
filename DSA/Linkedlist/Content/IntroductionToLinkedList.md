# Introduction to Linked List

## What is this?
Introduction to nodes and links. A Linked List is a dynamic data structure where items are stored in nodes, connected by pointers.

## Why do we need it?
- To understand dynamic data storage.
- Unlike arrays, it doesn't need contiguous memory.

## Algorithm Logic
Node → Data + Next reference.

## Common Mistakes
- Confusing node with value
- Assuming contiguous memory addresses

## Time Complexity
Access: O(n)

## Space Complexity
O(n)

## Real Life Use
- Music player playlist (Next/Prev song)
- Browser history

## Key Takeaways
- Nodes are building blocks
- Dynamic size (can grow/shrink)

## Recommended Problems
- Introduction to Linked List (GFG)

## Mini Practice
### Problem: Create Node
Create a simple node structure.
Input: Value: 10
Output: Node(10) -> null
Hint: Define class Node with data and next.
Solution: class Node { int data; Node next; }
