# Hash Table

## What is this?
A hash table is the underlying data structure for HashMaps/Sets.

## Why do we need it?
- Efficient data access
- Base implementation for Dictionary types

## Algorithm Logic
- Array of buckets
- Hash function maps Key -> Bucket Index

## Common Mistakes
- Ignoring Load Factor (Table becomes too full -> Slow)

## Time Complexity
O(1) average

## Space Complexity
O(n)

## Real Life Use
- Symbol Table in Compiler
- Database Index

## Key Takeaways
- Core hashing structure
- Tradeoff space for time

## Recommended Problems
- Hash Table Implementation (GFG)

## Mini Practice
### Problem: Basic Table
Put (Key: 10, Val: "A") into table size 5.
Input: 10, "A"
Output: Index 0 -> (10, "A")
Hint: 10 % 5 = 0.
Solution: buckets[0] = new Entry(10, "A");
