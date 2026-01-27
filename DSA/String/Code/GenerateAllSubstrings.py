# Generate All Substrings in Python
# Print all possible substrings of a given string

def generate_substrings(str_val):
    """Generate all substrings of a string"""
    substrings = []
    n = len(str_val)
    
    # Outer loop for starting position
    for i in range(n):
        # Inner loop for ending position
        for j in range(i + 1, n + 1):
            substrings.append(str_val[i:j])
    
    return substrings

# Test 1
print("String: ABC")
str1 = "ABC"
subs1 = generate_substrings(str1)
print("All substrings:")
for sub in subs1:
    print(sub)
print(f"Total substrings: {len(subs1)}\n")

# Test 2
print("String: HELLO")
str2 = "HELLO"
subs2 = generate_substrings(str2)
print("All substrings:")
for sub in subs2:
    print(sub)
print(f"Total substrings: {len(subs2)}\n")

# Method 2: Using nested loops directly
print("Method 2: Direct approach")
str3 = "PY"
print(f"String: {str3}")
print("All substrings:")
for i in range(len(str3)):
    for j in range(i + 1, len(str3) + 1):
        print(str3[i:j])

# Method 3: Using itertools combinations
print("\n\nMethod 3: Using list comprehension")
str4 = "AB"
substrings = [str4[i:j] for i in range(len(str4)) for j in range(i + 1, len(str4) + 1)]
print(f"String: {str4}")
print("All substrings:")
for sub in substrings:
    print(sub)
print(f"Total: {len(substrings)}")

# Method 4: Get substrings of specific length
print("\n\nMethod 4: Substrings of length 2")
str5 = "HELLO"
substrings_len2 = [str5[i:i+2] for i in range(len(str5) - 1)]
print(f"String: {str5}")
print("Substrings of length 2:")
print(substrings_len2)
