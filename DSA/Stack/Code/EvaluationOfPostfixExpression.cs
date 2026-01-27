// Evaluation of Postfix Expression in C#

using System;
using System.Collections.Generic;

class EvaluationOfPostfixExpression {
    static int Evaluate(int a, int b, char op) {
        switch(op) {
            case '+': return a + b;
            case '-': return a - b;
            case '*': return a * b;
            case '/': return a / b;
            case '^': return (int)Math.Pow(a, b);
        }
        return 0;
    }
    
    static bool IsOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
    }
    
    static int EvaluatePostfixExpression(string postfix) {
        Stack<int> stack = new Stack<int>();
        
        foreach (char c in postfix) {
            if (char.IsDigit(c)) {
                stack.Push(c - '0');
            } else if (IsOperator(c)) {
                int b = stack.Pop();
                int a = stack.Pop();
                stack.Push(Evaluate(a, b, c));
            }
        }
        
        return stack.Pop();
    }
    
    static void Main() {
        string postfix = "23+4*5-";
        
        Console.WriteLine("=== Evaluation of Postfix Expression ===\n");
        Console.WriteLine("Postfix Expression: " + postfix);
        Console.WriteLine("Result: " + EvaluatePostfixExpression(postfix) + "\n");
        
        Console.WriteLine("Steps (23+4*5-):");
        Console.WriteLine("1. Push 2");
        Console.WriteLine("2. Push 3");
        Console.WriteLine("3. Pop 3,2; Compute 2+3=5; Push 5");
        Console.WriteLine("4. Push 4");
        Console.WriteLine("5. Pop 4,5; Compute 5*4=20; Push 20");
        Console.WriteLine("6. Push 5");
        Console.WriteLine("7. Pop 5,20; Compute 20-5=15; Push 15\n");
        
        Console.WriteLine("Complexity: O(n)");
    }
}
