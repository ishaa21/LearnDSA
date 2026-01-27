# Infix to Postfix in Python

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

def infix_to_postfix(infix):
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
            stack.pop()  # Remove '('
        elif is_operator(c):
            while stack and precedence(stack[-1]) >= precedence(c):
                postfix += stack.pop()
            stack.append(c)
    
    while stack:
        postfix += stack.pop()
    
    return postfix

# Test
infix = "a+b*c-d/e"

print("=== Infix to Postfix ===\n")
print(f"Infix Expression: {infix}")

postfix = infix_to_postfix(infix)

print(f"Postfix Expression: {postfix}\n")

print("Algorithm: Shunting-yard")
print("Complexity: O(n)")
