# Evaluation of Infix Expression in Python

def precedence(c):
    if c in ['+', '-']:
        return 1
    if c in ['*', '/']:
        return 2
    if c == '^':
        return 3
    return 0

def evaluate(a, b, op):
    if op == '+':
        return a + b
    elif op == '-':
        return a - b
    elif op == '*':
        return a * b
    elif op == '/':
        return a // b

def evaluate_infix(infix):
    nums = []
    ops = []
    
    for c in infix:
        if c.isdigit():
            nums.append(int(c))
        elif c == '(':
            ops.append(c)
        elif c == ')':
            while ops and ops[-1] != '(':
                op = ops.pop()
                b = nums.pop()
                a = nums.pop()
                nums.append(evaluate(a, b, op))
            ops.pop()  # Remove '('
        elif c in ['+', '-', '*', '/']:
            while ops and ops[-1] != '(' and precedence(ops[-1]) >= precedence(c):
                op = ops.pop()
                b = nums.pop()
                a = nums.pop()
                nums.append(evaluate(a, b, op))
            ops.append(c)
    
    while ops:
        op = ops.pop()
        b = nums.pop()
        a = nums.pop()
        nums.append(evaluate(a, b, op))
    
    return nums[0]

# Test
infix = "2+3*4-5"

print("=== Evaluation of Infix Expression ===\n")
print(f"Infix Expression: {infix}")
print(f"Result: {evaluate_infix(infix)}\n")

print("Operator Precedence: * / > + -")
print("Complexity: O(n)")
