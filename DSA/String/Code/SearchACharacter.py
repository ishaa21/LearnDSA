# Search a Character in a String in Python
# Find position and count of a character

str1 = "Hello World"
target = 'l'

# Method 1: Using find() - returns index of first occurrence
print("Using find():")
pos = str1.find(target)
if pos != -1:
    print(f"Character '{target}' found at index: {pos}")
else:
    print(f"Character '{target}' not found")

# Method 2: Using rfind() - finds last occurrence
print("\nUsing rfind():")
lastPos = str1.rfind(target)
if lastPos != -1:
    print(f"Last occurrence of '{target}' at index: {lastPos}")

# Method 3: Using index() - similar to find() but raises exception
print("\nUsing index():")
try:
    pos = str1.index(target)
    print(f"Character '{target}' found at index: {pos}")
except ValueError:
    print(f"Character '{target}' not found")

# Method 4: Manual search with loop
print("\nManual search - all occurrences:")
count = 0
for i, char in enumerate(str1):
    if char == target:
        print(f"Found at index: {i}")
        count += 1
print(f"Total occurrences: {count}")

# Method 5: Using count() method
print("\nUsing count():")
total = str1.count(target)
print(f"Total occurrences of '{target}': {total}")

# Method 6: Finding all indices
print("\nFinding all indices:")
indices = [i for i, char in enumerate(str1) if char == target]
print(f"Indices: {indices}")

# Method 7: Case-insensitive search
print("\nCase-insensitive search for 'W':")
target2 = 'W'
lowerStr = str1.lower()
occurrences = lowerStr.count(target2.lower())
print(f"Case-insensitive count: {occurrences}")

# Method 8: Using string methods
print("\nUsing startswith and in operator:")
print(f"'{target}' in '{str1}': {target in str1}")
