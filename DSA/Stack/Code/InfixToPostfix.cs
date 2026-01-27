// Infix to Postfix in C#

using System;
using System.Collections.Generic;
using System.Text;

class InfixToPostfix {
    static int Precedence(char c) {
        if (c == '+' || c == '-') return 1;
        if (c == '*' || c == '/') return 2;
        if (c == '^') return 3;
        return 0;
    }
    
    static bool IsOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
    }
    
    static string InfixToPostfixConversion(string infix) {
        StringBuilder postfix = new StringBuilder();
        Stack<char> stack = new Stack<char>();
        
        foreach (char c in infix) {
            if (char.IsLetterOrDigit(c)) {
                postfix.Append(c);
            } else if (c == '(') {
                stack.Push(c);
            } else if (c == ')') {
                while (stack.Count > 0 && stack.Peek() != '(') {
                    postfix.Append(stack.Pop());
                }
                stack.Pop(); // Remove '('
            } else if (IsOperator(c)) {
                while (stack.Count > 0 && Precedence(stack.Peek()) >= Precedence(c)) {
                    postfix.Append(stack.Pop());
                }
                stack.Push(c);
            }
        }
        
        while (stack.Count > 0) {
            postfix.Append(stack.Pop());
        }
        
        return postfix.ToString();
    }
    
    static void Main() {
        string infix = "a+b*c-d/e";
        
        Console.WriteLine("=== Infix to Postfix ===\n");
        Console.WriteLine("Infix Expression: " + infix);
        
        string postfix = InfixToPostfixConversion(infix);
        
        Console.WriteLine("Postfix Expression: " + postfix + "\n");
        
        Console.WriteLine("Algorithm: Shunting-yard");
        Console.WriteLine("Complexity: O(n)");
    }
}
