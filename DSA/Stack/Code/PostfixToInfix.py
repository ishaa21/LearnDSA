# Postfix to Infix in Python

def is_operator(c):
    return c in ['+', '-', '*', '/']

def postfix_to_infix(postfix):
    stack = []
    
    for c in postfix:
        if is_operator(c):
            op2 = stack.pop()
            op1 = stack.pop()
            
            temp = f"({op1}{c}{op2})"
            stack.append(temp)
        else:
            stack.append(c)
    
    return stack[0]

# Test
postfix = "ab+cd*-"

print("=== Postfix to Infix ===\n")
print(f"Postfix Expression: {postfix}")

infix = postfix_to_infix(postfix)

print(f"Infix Expression: {infix}\n")
print("Complexity: O(n)")
