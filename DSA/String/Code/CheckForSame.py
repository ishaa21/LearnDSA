# Check for Same (String Comparison) in Python
# Different methods to compare two strings

str1 = "Hello"
str2 = "Hello"
str3 = "hello"
str4 = "World"

# Method 1: Using == operator
print("Using == operator:")
print(f"str1 == str2: {str1 == str2}")  # True
print(f"str1 == str3: {str1 == str3}")  # False
print(f"str1 == str4: {str1 == str4}")  # False

# Method 2: Using != operator
print("\nUsing != operator:")
print(f"str1 != str3: {str1 != str3}")  # True
print(f"str1 != str2: {str1 != str2}")  # False

# Method 3: Case-insensitive comparison
print("\nCase-insensitive comparison:")
print(f"str1.lower() == str3.lower(): {str1.lower() == str3.lower()}")  # True
print(f"str1.upper() == str3.upper(): {str1.upper() == str3.upper()}")  # True

# Method 4: Comparing specific parts
print("\nComparing first 3 characters:")
str5 = "Helloworld"
str6 = "Hellouni"
print(f"str5[:3] == str6[:3]: {str5[:3] == str6[:3]}")  # True

# Method 5: Ignoring case and spaces
print("\nIgnoring case and spaces:")
str7 = "Hello World"
str8 = "hello world"
print(f"Normalized equal: {str7.lower().strip() == str8.lower().strip()}")

# Method 6: Using == vs is
print("\nUsing == vs is (identity vs equality):")
str9 = "Hello"
str10 = "Hello"
str11 = str9
print(f"str9 == str10: {str9 == str10}")  # True (value equal)
print(f"str9 is str10: {str9 is str10}")  # May be True (same object)
print(f"str9 is str11: {str9 is str11}")  # True (same object)

# Method 7: Using comparison operators
print("\nUsing comparison operators:")
print(f"'apple' < 'banana': {'apple' < 'banana'}")  # True
print(f"'zebra' > 'apple': {'zebra' > 'apple'}")    # True
