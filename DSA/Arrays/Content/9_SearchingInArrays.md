# Searching in Arrays

## What is this?
Searching finds an element in array.

## Why do we need it?
- To check presence of data

## Algorithm Logic
Linear search (Check one by one)

## Common Mistakes
- Not stopping after found

## Time Complexity
O(n)

## Space Complexity
O(1)

## Real Life Use
- Finding a contact
- Searching a product

## Key Takeaways
- Simple but slow
- Used when array unsorted

## Mini Practice
### Problem: Find Index
Search for value 50 in array. Return index if found, else -1.
Input: [10, 20, 50, 60], Target: 50
Output: Index 2
Hint: Loop through array. If arr[i] == target, return i.
Solution: for(i=0; i<n; i++) if(arr[i]==target) return i; return -1;

### Problem: Count Occurrences
Count how many times 5 appears in the array.
Input: [5, 3, 5, 7, 5, 1]
Output: 3
Hint: Linear search but count instead of returning index.
Solution: count=0; for x in arr: if x==5: count+=1

### Problem: Search All Indices
Find all indices where element 3 appears.
Input: [3, 7, 3, 2, 3]
Output: [0, 2, 4]
Hint: Use linear search but collect all matching indices.
Solution: indices=[]; for i in range(len(arr)): if arr[i]==3: indices.append(i)
