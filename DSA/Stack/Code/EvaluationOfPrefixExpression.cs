// Evaluation of Prefix Expression in C#

using System;
using System.Collections.Generic;

class EvaluationOfPrefixExpression {
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
    
    static int EvaluatePrefixExpression(string prefix) {
        Stack<int> stack = new Stack<int>();
        int len = prefix.Length;
        
        for (int i = len - 1; i >= 0; i--) {
            char c = prefix[i];
            
            if (char.IsDigit(c)) {
                stack.Push(c - '0');
            } else if (IsOperator(c)) {
                int a = stack.Pop();
                int b = stack.Pop();
                stack.Push(Evaluate(a, b, c));
            }
        }
        
        return stack.Pop();
    }
    
    static void Main() {
        string prefix = "-*+2345";
        
        Console.WriteLine("=== Evaluation of Prefix Expression ===\n");
        Console.WriteLine("Prefix Expression: " + prefix);
        Console.WriteLine("Result: " + EvaluatePrefixExpression(prefix) + "\n");
        
        Console.WriteLine("Steps (-*+2345):");
        Console.WriteLine("1. Process 5: Push 5");
        Console.WriteLine("2. Process 4: Push 4");
        Console.WriteLine("3. Process 3: Push 3");
        Console.WriteLine("4. Process +: Pop 3,4; Compute 3+4=7; Push 7");
        Console.WriteLine("5. Process 2: Push 2");
        Console.WriteLine("6. Process *: Pop 2,7; Compute 2*7=14; Push 14");
        Console.WriteLine("7. Process -: Pop 14,5; Compute 14-5=9; Push 9\n");
        
        Console.WriteLine("Complexity: O(n)");
    }
}
