# Reverse a String in Python
# Different methods to reverse a string

str1 = "Hello World"

# Method 1: Using slicing
print("Method 1: Using slicing")
original = str1
reversed_str = original[::-1]
print(f"Original: {original}")
print(f"Reversed: {reversed_str}")

# Method 2: Using reversed() function
print("\nMethod 2: Using reversed() function")
original = str1
reversed_str = ''.join(reversed(original))
print(f"Original: {original}")
print(f"Reversed: {reversed_str}")

# Method 3: Using loop
print("\nMethod 3: Using loop")
original = "Programming"
reversed_str = ""
for char in original:
    reversed_str = char + reversed_str
print(f"Original: {original}")
print(f"Reversed: {reversed_str}")

# Method 4: Using list and reverse()
print("\nMethod 4: Using list.reverse()")
original = "Python"
chars = list(original)
chars.reverse()
reversed_str = ''.join(chars)
print(f"Original: {original}")
print(f"Reversed: {reversed_str}")

# Method 5: Using recursion
print("\nMethod 5: Using recursion")
def reverse_recursive(s):
    if len(s) == 0:
        return s
    else:
        return reverse_recursive(s[1:]) + s[0]

original = "Recursion"
reversed_str = reverse_recursive(original)
print(f"Original: {original}")
print(f"Reversed: {reversed_str}")

# Method 6: Using reduce
print("\nMethod 6: Using reduce")
from functools import reduce
original = "Reduce"
reversed_str = reduce(lambda x, y: y + x, original)
print(f"Original: {original}")
print(f"Reversed: {reversed_str}")

# Method 7: Using stack concept
print("\nMethod 7: Using stack")
original = "Stack"
stack = list(original)
reversed_str = ""
while stack:
    reversed_str += stack.pop()
print(f"Original: {original}")
print(f"Reversed: {reversed_str}")
