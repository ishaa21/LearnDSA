# Infix to Prefix in Python

def precedence(c):
    if c in ['+', '-']:
        return 1
    if c in ['*', '/']:
        return 2
    if c == '^':
        return 3
    return 0

def is_operator(c):
    return c in ['+', '-', '*', '/', '^']

def infix_to_prefix(infix):
    # Reverse the string
    infix = infix[::-1]
    
    # Swap ( and )
    infix = infix.replace('(', 'TEMP').replace(')', '(').replace('TEMP', ')')
    
    # Convert to postfix
    stack = []
    postfix = ""
    
    for c in infix:
        if c.isalnum():
            postfix += c
        elif c == '(':
            stack.append(c)
        elif c == ')':
            while stack and stack[-1] != '(':
                postfix += stack.pop()
            stack.pop()
        elif is_operator(c):
            while stack and precedence(stack[-1]) >= precedence(c):
                postfix += stack.pop()
            stack.append(c)
    
    while stack:
        postfix += stack.pop()
    
    # Reverse result
    return postfix[::-1]

# Test
infix = "a+b*c-d/e"

print("=== Infix to Prefix ===\n")
print("Algorithm: Reverse -> Convert to Postfix -> Reverse")
print("Steps:")
print("1. Reverse the infix expression")
print("2. Swap ( and )")
print("3. Convert to postfix")
print("4. Reverse result\n")

print(f"Infix: {infix}")
print(f"Prefix: {infix_to_prefix(infix)}\n")
print("Complexity: O(n)")
