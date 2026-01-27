# Detect Cycle in Linked List

## What is this?
Checking if loop exists (node points back to previous node).

## Why do we need it?
- Avoid infinite loops.
- Corrupted list detection.

## Algorithm Logic
Floyd’s Cycle Finding Algorithm (Tortoise and Hare).
- Slow moves 1 step.
- Fast moves 2 steps.
- If they meet -> Cycle.

## Common Mistakes
- Wrong pointer movement
- Null pointer exception

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Garbage collection
- Network packet routing loops

## Key Takeaways
- Floyd’s cycle detection
- Fast/Slow pointers

## Recommended Problems
- Linked List Cycle (LeetCode)

## Mini Practice
### Problem: Has Cycle?
1 -> 2 -> 3 -> 1 (Loop).
Input: 1 -> 2 -> 3 -> 1
Output: True
Hint: Slow=1, Fast=1. Next step: Slow=2, Fast=3. Next: Slow=3, Fast=2. Next: Meet.
Solution: while(fast!=null && fast.next!=null) Check(slow==fast)
