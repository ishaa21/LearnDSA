# Remove All Occurrences of a Character in Python
# Remove all instances of a specific character

str1 = "Hello World"

print("Original string:", str1)

# Method 1: Using replace()
print("\nUsing replace():")
result = str1.replace('l', '')
print("After removing all 'l':", result)

result = str1.replace('o', '')
print("After removing all 'o':", result)

result = str1.replace(' ', '')
print("After removing all spaces:", result)

# Method 2: Using list comprehension
print("\nUsing list comprehension:")
result = ''.join([char for char in str1 if char != 'l'])
print("After removing all 'l':", result)

# Method 3: Using filter()
print("\nUsing filter():")
result = ''.join(filter(lambda x: x != 'l', str1))
print("After removing all 'l':", result)

# Method 4: Using str.translate()
print("\nUsing translate():")
result = str1.translate(str.maketrans('', '', 'l'))
print("After removing all 'l':", result)

# Method 5: Manual approach with loop
print("\nManual approach with loop:")
original = "Programming Language"
target = 'a'
result = ""

for char in original:
    if char != target:
        result += char

print(f"Original: {original}")
print(f"After removing all '{target}': {result}")

# Method 6: Using regex
import re
print("\nUsing regex:")
result = re.sub('l', '', str1)
print("After removing all 'l':", result)

# Method 7: Remove multiple characters
print("\nRemoving multiple characters:")
text = "Hello World!"
result = text.replace('l', '').replace('o', '')
print(f"After removing 'l' and 'o': {result}")

# Method 8: Count removals
print("\nCount before and after:")
original_str = "Mississippi"
target_char = 's'
count_before = original_str.count(target_char)
result = original_str.replace(target_char, '')
count_after = result.count(target_char)
print(f"Original: {original_str}")
print(f"Removed: {count_before} occurrences")
print(f"Result: {result}")
