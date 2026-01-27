// Prefix to Infix in C#

using System;
using System.Collections.Generic;

class PrefixToInfix {
    static bool IsOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/');
    }
    
    static string PrefixToInfixConversion(string prefix) {
        Stack<string> stack = new Stack<string>();
        int len = prefix.Length;
        
        for (int i = len - 1; i >= 0; i--) {
            char c = prefix[i];
            
            if (IsOperator(c)) {
                string op1 = stack.Pop();
                string op2 = stack.Pop();
                
                string temp = "(" + op1 + c + op2 + ")";
                stack.Push(temp);
            } else {
                stack.Push(c.ToString());
            }
        }
        
        return stack.Pop();
    }
    
    static void Main() {
        string prefix = "-+ab*cd";
        
        Console.WriteLine("=== Prefix to Infix ===\n");
        Console.WriteLine("Prefix Expression: " + prefix);
        
        string infix = PrefixToInfixConversion(prefix);
        
        Console.WriteLine("Infix Expression: " + infix + "\n");
        Console.WriteLine("Complexity: O(n)");
    }
}
