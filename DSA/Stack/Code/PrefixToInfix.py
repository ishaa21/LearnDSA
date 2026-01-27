# Prefix to Infix in Python

def is_operator(c):
    return c in ['+', '-', '*', '/']

def prefix_to_infix(prefix):
    stack = []
    length = len(prefix)
    
    for i in range(length - 1, -1, -1):
        c = prefix[i]
        
        if is_operator(c):
            op1 = stack.pop()
            op2 = stack.pop()
            
            temp = f"({op1}{c}{op2})"
            stack.append(temp)
        else:
            stack.append(c)
    
    return stack[0]

# Test
prefix = "-+ab*cd"

print("=== Prefix to Infix ===\n")
print(f"Prefix Expression: {prefix}")

infix = prefix_to_infix(prefix)

print(f"Infix Expression: {infix}\n")
print("Complexity: O(n)")
