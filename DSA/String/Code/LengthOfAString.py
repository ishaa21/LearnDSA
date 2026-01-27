# Length of a String in Python
# Different methods to find the length of a string

# Method 1: Using len() function
str1 = "Hello World"
len1 = len(str1)
print("Using len():", len1)

# Method 2: Using __len__() method
len2 = str1.__len__()
print("Using __len__():", len2)

# Method 3: Manual counting with loop
len3 = 0
for char in str1:
    len3 += 1
print("Using manual loop:", len3)

# Method 4: Using count() method
len4 = str1.count('') - 1
print("Using count():", len4)

# Method 5: Empty string length
empty_len = len("")
print("Empty string length:", empty_len)

# Method 6: Single character length
single_len = len("A")
print("Single character length:", single_len)

# Method 7: String with spaces
space_str = "Hello   World"
print("String with spaces length:", len(space_str))

# Method 8: Get length and check
str2 = input("Enter a string: ")
print(f"Length of input: {len(str2)}")

# Method 9: String with special characters
special_str = "Hello@World#123!@#"
print(f"Special string length: {len(special_str)}")
