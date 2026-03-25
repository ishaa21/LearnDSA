# Permutations

## What is this?
Arrangements where order matters (n! for distinct items).

## Why do we need it?
Ordering problems like TSP (traveling salesman).

## Algorithm Logic
Backtracking: Swap or use visited array
For each position, try every unused element.

## Common Mistakes
Confusing with combinations (order irrelevant).

## Time Complexity
O(n!)

## Space Complexity
O(n) recursion depth.

## Real Life Use
Anagrams, sequences, password cracking.

## Key Takeaways
- Order matters
- n! grows extremely fast

## Mini Practice
### Problem
Input: "abc"
Output: abc, acb, bac, bca, cab, cba (6 total)
Hint: Try each char at index 0, then recurse.
Solution: 6 rearrangements.

### Problem: Permutations with Duplicates
Generate all unique permutations of "aab".
Input: "aab"
Output: ["aab", "aba", "baa"]
Hint: Sort first, then skip duplicates at each level of recursion.
Solution: Sort: "aab". Fix 'a' at pos 0, permute "ab"->"ab","ba". Skip duplicate 'a'. Fix 'b' at pos 0, permute "aa"->"aa". Result: aab, aba, baa.

### Problem: Next Permutation
Find the next permutation of [1, 2, 3].
Input: [1, 2, 3]
Output: [1, 3, 2]
Hint: Find rightmost pair where arr[i] < arr[i+1]. Swap arr[i] with next larger element to its right. Reverse suffix.
Solution: i=1 (2<3). Swap 2 and 3 -> [1,3,2]. Already reversed. Answer: [1,3,2].
