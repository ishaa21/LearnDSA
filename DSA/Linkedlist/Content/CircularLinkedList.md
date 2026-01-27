# Circular Linked List

## What is this?
Last node points back to first node. There is no NULL end.

## Why do we need it?
- Continuous data flow
- Efficient rotation operations

## Algorithm Logic
Last.next = head

## Common Mistakes
- Infinite loops during traversal (no null to stop)

## Time Complexity
Traversal: O(n)

## Space Complexity
O(n)

## Real Life Use
- Round Robin scheduling
- Multiplayer games (Turn based)

## Key Takeaways
- No null end
- Cycle by definition

## Recommended Problems
- Circular Linked List (GFG)

## Mini Practice
### Problem: Full Cycle
Print one full cycle of 1 -> 2 -> 3 -> (1).
Input: 1, 2, 3
Output: 1, 2, 3
Hint: Stop when current == head again.
Solution: do { print(curr.data); curr=curr.next; } while(curr != head);
