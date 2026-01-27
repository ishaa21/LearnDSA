# Insert a Character in a String in Python
# Insert character at specific position

str1 = "Hello World"

print("Original string:", str1)

# Method 1: Using insert() with list
print("\nUsing list conversion:")
lst = list(str1)
lst.insert(0, 'H')
result = ''.join(lst)
print("After inserting 'H' at position 0:", result)

# Method 2: Using slicing
print("\nUsing slicing:")
str2 = str1
pos = 5
result = str2[:pos] + '!' + str2[pos:]
print("After inserting '!' at position 5:", result)

# Method 3: Insert at beginning
result = '*' + str1
print("After inserting '*' at beginning:", result)

# Method 4: Insert at end
result = str1 + '*'
print("After inserting '*' at end:", result)

# Method 5: Multiple insertions
pos1, pos2 = 0, 11
result = str1[:pos2] + '!' + str1[pos2:]
result = result[:pos1] + '*' + result[pos1:]
print("After multiple insertions:", result)

# Method 6: Using format or f-string
str3 = "Hi"
pos = 1
result = f"{str3[:pos]}*{str3[pos:]}"
print(f"Inserting '*' at position {pos} in 'Hi':", result)

# Method 7: Insert multiple characters
str4 = "Test"
result = str4[:2] + "***" + str4[2:]
print("After inserting '***' at position 2:", result)

# Method 8: Function for insertion
def insert_char(string, position, char):
    return string[:position] + char + string[position:]

print("\nUsing function:")
result = insert_char(str1, 6, '@')
print("After inserting '@' at position 6:", result)
