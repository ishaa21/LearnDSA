// Evaluation of Infix Expression in C#

using System;
using System.Collections.Generic;

class EvaluationOfInfixExpression {
    static int Precedence(char c) {
        if (c == '+' || c == '-') return 1;
        if (c == '*' || c == '/') return 2;
        if (c == '^') return 3;
        return 0;
    }
    
    static int Evaluate(int a, int b, char op) {
        switch(op) {
            case '+': return a + b;
            case '-': return a - b;
            case '*': return a * b;
            case '/': return a / b;
        }
        return 0;
    }
    
    static int EvaluateInfixExpression(string infix) {
        Stack<int> nums = new Stack<int>();
        Stack<char> ops = new Stack<char>();
        
        foreach (char c in infix) {
            if (char.IsDigit(c)) {
                nums.Push(c - '0');
            } else if (c == '(') {
                ops.Push(c);
            } else if (c == ')') {
                while (ops.Count > 0 && ops.Peek() != '(') {
                    char op = ops.Pop();
                    int b = nums.Pop();
                    int a = nums.Pop();
                    nums.Push(Evaluate(a, b, op));
                }
                ops.Pop(); // Remove '('
            } else if (c == '+' || c == '-' || c == '*' || c == '/') {
                while (ops.Count > 0 && ops.Peek() != '(' && 
                       Precedence(ops.Peek()) >= Precedence(c)) {
                    char op = ops.Pop();
                    int b = nums.Pop();
                    int a = nums.Pop();
                    nums.Push(Evaluate(a, b, op));
                }
                ops.Push(c);
            }
        }
        
        while (ops.Count > 0) {
            char op = ops.Pop();
            int b = nums.Pop();
            int a = nums.Pop();
            nums.Push(Evaluate(a, b, op));
        }
        
        return nums.Pop();
    }
    
    static void Main() {
        string infix = "2+3*4-5";
        
        Console.WriteLine("=== Evaluation of Infix Expression ===\n");
        Console.WriteLine("Infix Expression: " + infix);
        Console.WriteLine("Result: " + EvaluateInfixExpression(infix) + "\n");
        
        Console.WriteLine("Operator Precedence: * / > + -");
        Console.WriteLine("Complexity: O(n)");
    }
}
