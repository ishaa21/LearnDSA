# Postfix to Prefix in Python

def is_operator(c):
    return c in ['+', '-', '*', '/']

def postfix_to_prefix(postfix):
    stack = []
    
    for c in postfix:
        if is_operator(c):
            op2 = stack.pop()
            op1 = stack.pop()
            
            temp = c + op1 + op2
            stack.append(temp)
        else:
            stack.append(c)
    
    return stack[0]

# Test
postfix = "ab+cd*-"

print("=== Postfix to Prefix ===\n")
print(f"Postfix Expression: {postfix}")

prefix = postfix_to_prefix(postfix)

print(f"Prefix Expression: {prefix}\n")
print("Complexity: O(n)")
