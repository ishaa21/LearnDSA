// Infix to Prefix in C#

using System;
using System.Collections.Generic;
using System.Text;

class InfixToPrefix {
    static int Precedence(char c) {
        if (c == '+' || c == '-') return 1;
        if (c == '*' || c == '/') return 2;
        if (c == '^') return 3;
        return 0;
    }
    
    static bool IsOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
    }
    
    static string InfixToPrefixConversion(string infix) {
        // Reverse the string
        char[] arr = infix.ToCharArray();
        Array.Reverse(arr);
        infix = new string(arr);
        
        // Swap ( and )
        infix = infix.Replace('(', 'T').Replace(')', '(').Replace('T', ')');
        
        // Convert to postfix
        Stack<char> stack = new Stack<char>();
        StringBuilder postfix = new StringBuilder();
        
        foreach (char c in infix) {
            if (char.IsLetterOrDigit(c)) {
                postfix.Append(c);
            } else if (c == '(') {
                stack.Push(c);
            } else if (c == ')') {
                while (stack.Count > 0 && stack.Peek() != '(') {
                    postfix.Append(stack.Pop());
                }
                stack.Pop();
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
        
        // Reverse result
        arr = postfix.ToString().ToCharArray();
        Array.Reverse(arr);
        return new string(arr);
    }
    
    static void Main() {
        string infix = "a+b*c-d/e";
        
        Console.WriteLine("=== Infix to Prefix ===\n");
        Console.WriteLine("Algorithm: Reverse -> Convert to Postfix -> Reverse");
        Console.WriteLine("Steps:");
        Console.WriteLine("1. Reverse the infix expression");
        Console.WriteLine("2. Swap ( and )");
        Console.WriteLine("3. Convert to postfix");
        Console.WriteLine("4. Reverse result\n");
        
        Console.WriteLine("Infix: " + infix);
        Console.WriteLine("Prefix: " + InfixToPrefixConversion(infix) + "\n");
        Console.WriteLine("Complexity: O(n)");
    }
}
