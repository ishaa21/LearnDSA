# Prefix to Postfix in Python

def is_operator(c):
    return c in ['+', '-', '*', '/']

def prefix_to_postfix(prefix):
    stack = []
    length = len(prefix)
    
    for i in range(length - 1, -1, -1):
        c = prefix[i]
        
        if is_operator(c):
            op1 = stack.pop()
            op2 = stack.pop()
            
            temp = op1 + op2 + c
            stack.append(temp)
        else:
            stack.append(c)
    
    return stack[0]

# Test
prefix = "-+ab*cd"

print("=== Prefix to Postfix ===\n")
print(f"Prefix Expression: {prefix}")

postfix = prefix_to_postfix(prefix)

print(f"Postfix Expression: {postfix}\n")
print("Complexity: O(n)")
