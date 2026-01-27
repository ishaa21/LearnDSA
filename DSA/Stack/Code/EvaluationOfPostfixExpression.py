# Evaluation of Postfix Expression in Python

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

def evaluate_postfix(postfix):
    stack = []
    
    for c in postfix:
        if c.isdigit():
            stack.append(int(c))
        elif is_operator(c):
            b = stack.pop()
            a = stack.pop()
            stack.append(evaluate(a, b, c))
    
    return stack[0]

# Test
postfix = "23+4*5-"

print("=== Evaluation of Postfix Expression ===\n")
print(f"Postfix Expression: {postfix}")
print(f"Result: {evaluate_postfix(postfix)}\n")

print("Steps (23+4*5-):")
print("1. Push 2")
print("2. Push 3")
print("3. Pop 3,2; Compute 2+3=5; Push 5")
print("4. Push 4")
print("5. Pop 4,5; Compute 5*4=20; Push 20")
print("6. Push 5")
print("7. Pop 5,20; Compute 20-5=15; Push 15\n")

print("Complexity: O(n)")
