# Valid Parentheses in Python

def is_valid_parentheses(s):
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    
    for c in s:
        if c in mapping:
            # Closing bracket
            if not stack or stack[-1] != mapping[c]:
                return False
            stack.pop()
        else:
            # Opening bracket
            stack.append(c)
    
    return len(stack) == 0

# Test
tests = [
    "()",
    "(){}[]",
    "([{}])",
    "([)]",
    "{[}",
    "(((",
    ")"
]

print("=== Valid Parentheses ===\n")

for test in tests:
    result = "Valid" if is_valid_parentheses(test) else "Invalid"
    print(f"Expression: {test} -> {result}")

print("\nComplexity: O(n)")
print("Space: O(n)")
