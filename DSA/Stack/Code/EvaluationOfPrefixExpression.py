# Evaluation of Prefix Expression in Python

def evaluate(a, b, op):
    if op == '+':
        return a + b
    elif op == '-':
        return a - b
    elif op == '*':
        return a * b
    elif op == '/':
        return a // b
    elif op == '^':
        return a ** b

def is_operator(c):
    return c in ['+', '-', '*', '/', '^']

def evaluate_prefix(prefix):
    stack = []
    length = len(prefix)
    
    for i in range(length - 1, -1, -1):
        c = prefix[i]
        
        if c.isdigit():
            stack.append(int(c))
        elif is_operator(c):
            a = stack.pop()
            b = stack.pop()
            stack.append(evaluate(a, b, c))
    
    return stack[0]

# Test
prefix = "-*+2345"

print("=== Evaluation of Prefix Expression ===\n")
print(f"Prefix Expression: {prefix}")
print(f"Result: {evaluate_prefix(prefix)}\n")

print("Steps (-*+2345):")
print("1. Process 5: Push 5")
print("2. Process 4: Push 4")
print("3. Process 3: Push 3")
print("4. Process +: Pop 3,4; Compute 3+4=7; Push 7")
print("5. Process 2: Push 2")
print("6. Process *: Pop 2,7; Compute 2*7=14; Push 14")
print("7. Process -: Pop 14,5; Compute 14-5=9; Push 9\n")

print("Complexity: O(n)")
