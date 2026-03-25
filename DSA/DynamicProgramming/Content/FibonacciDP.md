# FibonacciDP

## What is this?
Finding Fibonacci numbers using DP.

## Why do we need it?
Classic DP example.
Shows optimization clearly.

## Algorithm Logic
Store previous results.

## Common Mistakes
Using recursion without DP.

## Time Complexity
O(n)

## Space Complexity
O(n)

## Real Life Use
Optimization problems.

## Key Takeaways
- DP beats recursion

## Mini Practice
### Problem
Input: N=10
Output: 55
Hint: Use an array to store F(i).
Solution: F(10) = 55

### Problem: Count Ways to Climb Stairs
Count ways to climb n stairs taking 1 or 2 steps at a time.
Input: n = 5
Output: 8 ways
Hint: This is exactly the Fibonacci sequence! ways(n) = ways(n-1) + ways(n-2).
Solution: ways(1)=1, ways(2)=2, ways(3)=3, ways(4)=5, ways(5)=8.

### Problem: Tribonacci
Calculate T(n) where T(n) = T(n-1) + T(n-2) + T(n-3), T(0)=0, T(1)=1, T(2)=1.
Input: n = 5
Output: T(5) = 7
Hint: Extend Fibonacci idea to 3 previous terms.
Solution: T(0)=0, T(1)=1, T(2)=1, T(3)=2, T(4)=4, T(5)=7.
