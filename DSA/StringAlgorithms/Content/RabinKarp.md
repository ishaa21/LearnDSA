# RabinKarp

## What is this?
Rabin–Karp is a string searching algorithm that uses hashing to find a pattern in a text.

## Why do we need it?
Fast pattern searching.
Useful when searching multiple patterns.
Foundation for plagiarism detection.

## Algorithm Logic
Calculate hash of pattern.
Calculate hash of text window.
Slide window and compare hashes.
If hashes match, verify characters.

## Common Mistakes
Not verifying after hash match.
Hash collisions ignored.

## Time Complexity
Average: O(n + m)
Worst: O(nm)

## Space Complexity
O(1)

## Real Life Use
Foundation for plagiarism detection.

## Key Takeaways
- Uses rolling hash
- Faster than brute force in practice

## Recommended Problems
- LeetCode: Implement strStr()
- GFG: Rabin Karp Algorithm

## Mini Practice
### Problem
Input: "abc" in "ababcab"
Output: Index 2
Hint: Calculate rolling hash.
Solution: Found at index 2.
