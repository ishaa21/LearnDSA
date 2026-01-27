# Deque (Double Ended Queue)

## What is this?
A deque allows insertion and deletion at both ends.

## Why do we need it?
- Flexible data access
- Used in sliding window problems

## Algorithm Logic
Insert/remove from front or rear

## Common Mistakes
- Forgetting boundary checks
- Wrong end operation (Insert Front vs Rear)

## Time Complexity
All operations: O(1)

## Space Complexity
O(n)

## Real Life Use
- Undo/Redo operations
- Browser history

## Key Takeaways
- Very flexible
- Can act as stack or queue

## Recommended Problems
- Design Circular Deque (LeetCode)
- Sliding Window Maximum (LeetCode)

## Mini Practice
### Problem: Both Ends
Insert 1 at front. Insert 2 at rear. Remove front.
Input: Front: 1, Rear: 2. Del Front.
Output: [2]
Hint: Deque supports push_front, push_back.
Solution: dq.push_front(1); dq.push_back(2); dq.pop_front();
