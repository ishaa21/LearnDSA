# HashSet

## What is this?
A HashSet stores unique elements only.

## Why do we need it?
- Remove duplicates from list
- Fast membership checking (Contains?)

## Algorithm Logic
- Uses Map internally (Key = Element, Value = Dummy)
- Hash checks if exists

## Common Mistakes
- Expecting order
- Thinking it stores duplicates

## Time Complexity
O(1) average

## Space Complexity
O(n)

## Real Life Use
- Unique Visitors counter
- Filtering list

## Key Takeaways
- No duplicates
- Fast lookup

## Mini Practice
### Problem: Unique
Find count of unique numbers in [1, 2, 2, 3].
Input: [1, 2, 2, 3]
Output: 3 (1, 2, 3)
Hint: Add all to Set. Return size.
Solution: set.addAll(arr); return set.size();
