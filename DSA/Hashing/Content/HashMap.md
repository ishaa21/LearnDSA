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

## Mini Practice
### Problem: Frequency
Count frequency of 'a' in "banana".
Input: "banana"
Output: a: 3, b: 1, n: 2
Hint: Key=Char, Value=Count.
Solution: map[char] = map.getOrDefault(char, 0) + 1;

### Problem: Word Frequency
Count frequency of each word in "the cat sat on the mat".
Input: "the cat sat on the mat"
Output: {the:2, cat:1, sat:1, on:1, mat:1}
Hint: Use HashMap where key=word, value=count.
Solution: Split string. For each word: map[word] = map.getOrDefault(word, 0) + 1.

### Problem: Two Sum with HashMap
Find two numbers in [2, 7, 11, 15] that add up to 9.
Input: [2, 7, 11, 15], target=9
Output: Indices [0, 1] (2 + 7 = 9)
Hint: For each element, check if (target - element) exists in map.
Solution: Store visited elements. For 2: check 7 not in map, add 2. For 7: check 2 in map. Return [0,1].
