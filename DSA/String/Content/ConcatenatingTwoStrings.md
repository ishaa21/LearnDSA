# Concatenating Two Strings

## What is this?
Joining two strings together into one.

## Why do we need it?
- Message creation ("Hello" + Name)
- Data formatting

## Algorithm Logic
- Create new string of size N+M
- Copy first
- Copy second

## Common Mistakes
- Inefficient concatenation in loops (Creates many temp objects)

## Time Complexity
O(n + m)

## Space Complexity
O(n + m)

## Real Life Use
- URL Construction
- Full Name display

## Key Takeaways
- Creates new string
- Use StringBuilder/Buffer for huge loops

## Recommended Problems
- Merge Strings Alternately (LeetCode)

## Mini Practice
### Problem: Join
Join "Hi" and "There".
Input: "Hi", "There"
Output: "HiThere"
Hint: "Hi" + "There".
Solution: Use + operator or concat().
