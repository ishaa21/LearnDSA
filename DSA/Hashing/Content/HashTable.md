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

## Mini Practice
### Problem: Basic Table
Put (Key: 10, Val: "A") into table size 5.
Input: 10, "A"
Output: Index 0 -> (10, "A")
Hint: 10 % 5 = 0.
Solution: buckets[0] = new Entry(10, "A");

### Problem: Design Hash Table
Insert keys [15, 25, 35, 45] into hash table of size 10 using h(k) = k % 10.
Input: Keys=[15,25,35,45], Size=10
Output: Index 5: 15->25->35->45 (all hash to 5)
Hint: All keys end in 5, so h(k)=5 for all. Use chaining.
Solution: 15%10=5, 25%10=5, 35%10=5, 45%10=5. Chain at index 5.

### Problem: Load Factor
Hash table size 7 with 5 elements. Calculate load factor.
Input: Size=7, Elements=5
Output: Load Factor = 5/7 = 0.714
Hint: Load factor = number of elements / table size.
Solution: LF = n/m = 5/7 â‰ˆ 0.71. Consider resizing if LF > 0.75.
