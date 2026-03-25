# Hash Functions

## What is this?
A hash function converts a key (string, object) into an integer index.

## Why do we need it?
- Uniform data distribution across array slots
- Reduce collisions

## Algorithm Logic
- Simple arithmetic (Key % Size)
- Bit operations

## Common Mistakes
- Non-uniform distribution (Clustering)
- Expensive computation (Slows down map)

## Time Complexity
O(1) (Ideally)

## Space Complexity
O(1)

## Real Life Use
- Cryptography (SHA-256) (Though different from map hashing)
- Load Balancing

## Key Takeaways
- Good hash function is crucial for HashMap performance
- Should be deterministic

## Mini Practice
### Problem: Simple Mod
Hash key 15 for table size 10.
Input: 15, Size 10
Output: Index 5
Hint: 15 % 10 = 5.
Solution: return key % tableSize;
