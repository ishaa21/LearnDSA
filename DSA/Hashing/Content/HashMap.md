# HashMap

## What is this?
A HashMap stores key-value pairs using hashing.

## Why do we need it?
- Fast lookup (O(1))
- Store relationships (ID -> User Name)

## Algorithm Logic
- Key -> Hash -> Index
- Store Value at Index

## Common Mistakes
- Assuming ordered data (HashMap is usually unordered)
- Using mutable keys

## Time Complexity
- Average: O(1)
- Worst: O(n)

## Space Complexity
O(n)

## Real Life Use
- Caching API responses
- Counting word frequencies

## Key Takeaways
- Key-value storage
- Workhorse of modern programming

## Recommended Problems
- Two Sum (LeetCode)
- Group Anagrams (LeetCode)

## Mini Practice
### Problem: Frequency
Count frequency of 'a' in "banana".
Input: "banana"
Output: a: 3, b: 1, n: 2
Hint: Key=Char, Value=Count.
Solution: map[char] = map.getOrDefault(char, 0) + 1;
