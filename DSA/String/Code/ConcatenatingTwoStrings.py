# Concatenating Two Strings in Python
# Join two strings together

str1 = "Hello"
str2 = "World"

# Method 1: Using + operator
print("Method 1: Using + operator")
result = str1 + " " + str2
print("Result:", result)

# Method 2: Using f-string
print("\nMethod 2: Using f-string")
result = f"{str1} {str2}"
print("Result:", result)

# Method 3: Using .format()
print("\nMethod 3: Using .format()")
result = "{} {}".format(str1, str2)
print("Result:", result)

# Method 4: Using % formatting
print("\nMethod 4: Using % formatting")
result = "%s %s" % (str1, str2)
print("Result:", result)

# Method 5: Using .join()
print("\nMethod 5: Using .join()")
result = " ".join([str1, str2])
print("Result:", result)

# Method 6: Multiple strings
print("\nMethod 6: Multiple strings")
str3 = "from"
str4 = "Python"
result = str1 + " " + str2 + " " + str3 + " " + str4
print("Result:", result)

# Method 7: Using .join() with multiple strings
print("\nMethod 7: .join() with multiple")
result = " ".join([str1, str2, str3, str4])
print("Result:", result)

# Method 8: Using list comprehension and join
print("\nMethod 8: Dynamic concatenation")
strings = ["Hello", "World", "from", "Python"]
result = " ".join(strings)
print("Result:", result)

# Method 9: Concatenating with repetition
print("\nMethod 9: With repetition")
result = str1 * 2 + " " + str2 * 2
print("Result:", result)
