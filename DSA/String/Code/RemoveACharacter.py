# Remove a Character from a String in Python
# Remove character at specific position or by value

str1 = "Hello World"

print("Original string:", str1)

# Method 1: Using slicing
print("\nUsing slicing:")
pos = 0
result = str1[:pos] + str1[pos + 1:]
print(f"After removing character at position {pos}:", result)

# Method 2: Remove character at position 5
pos = 5
result = str1[:pos] + str1[pos + 1:]
print(f"After removing character at position {pos}:", result)

# Method 3: Remove last character
result = str1[:-1]
print("After removing last character:", result)

# Method 4: Remove using list
lst = list(str1)
lst.pop(0)  # Remove at position 0
result = ''.join(lst)
print("Using list.pop():", result)

# Method 5: Remove all occurrences of a character
print("\nRemoving all 'l':")
result = str1.replace('l', '')
print("Using replace():", result)

# Method 6: Remove using filter
result = ''.join(filter(lambda x: x != 'l', str1))
print("Using filter():", result)

# Method 7: Remove using list comprehension
result = ''.join([char for char in str1 if char != 'l'])
print("Using list comprehension:", result)

# Method 8: Remove first occurrence only
print("\nRemoving first 'l' only:")
result = str1.replace('l', '', 1)
print("Using replace with count=1:", result)

# Method 9: Remove using str.translate()
result = str1.translate(str.maketrans('', '', 'l'))
print("Using translate():", result)
