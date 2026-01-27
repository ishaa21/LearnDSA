// Prefix to Postfix in C#

using System;
using System.Collections.Generic;

class PrefixToPostfix {
    static bool IsOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/');
    }
    
    static string PrefixToPostfixConversion(string prefix) {
        Stack<string> stack = new Stack<string>();
        int len = prefix.Length;
        
        for (int i = len - 1; i >= 0; i--) {
            char c = prefix[i];
            
            if (IsOperator(c)) {
                string op1 = stack.Pop();
                string op2 = stack.Pop();
                
                string temp = op1 + op2 + c;
                stack.Push(temp);
            } else {
                stack.Push(c.ToString());
            }
        }
        
        return stack.Pop();
    }
    
    static void Main() {
        string prefix = "-+ab*cd";
        
        Console.WriteLine("=== Prefix to Postfix ===\n");
        Console.WriteLine("Prefix Expression: " + prefix);
        
        string postfix = PrefixToPostfixConversion(prefix);
        
        Console.WriteLine("Postfix Expression: " + postfix + "\n");
        Console.WriteLine("Complexity: O(n)");
    }
}
