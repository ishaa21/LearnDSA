# Collision Handling

## What is this?
Collision happens when two keys map to the same index.

## Why do we need it?
- Prevent data loss (Two items can't occupy one slot)
- Maintain correctness of map

## Algorithm Logic
1. **Chaining**: Store list/tree at each index.
2. **Open Addressing**: Find next empty slot (Linear Probing).

## Common Mistakes
- Ignoring collisions during implementation
- Assuming hash is always unique

## Time Complexity
- Average: O(1)
- Worst: O(n) (If all collision)

## Space Complexity
O(n)

## Real Life Use
- Database Indexing
- Caching

## Key Takeaways
- Collisions are unavoidable (Pigeonhole principle)
- Handling technique defines performance under load

## Mini Practice
### Problem: Chain
Insert 5 and 15 into size 10 table (Mod 10).
Input: 5, 15
Output: Index 5 -> [5, 15]
Hint: Both 5%10 and 15%10 are 5. Link them.
Solution: array[5].add(15);
