// Postfix to Prefix in C#

using System;
using System.Collections.Generic;

class PostfixToPrefix {
    static bool IsOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/');
    }
    
    static string PostfixToPrefixConversion(string postfix) {
        Stack<string> stack = new Stack<string>();
        
        foreach (char c in postfix) {
            if (IsOperator(c)) {
                string op2 = stack.Pop();
                string op1 = stack.Pop();
                
                string temp = c + op1 + op2;
                stack.Push(temp);
            } else {
                stack.Push(c.ToString());
            }
        }
        
        return stack.Pop();
    }
    
    static void Main() {
        string postfix = "ab+cd*-";
        
        Console.WriteLine("=== Postfix to Prefix ===\n");
        Console.WriteLine("Postfix Expression: " + postfix);
        
        string prefix = PostfixToPrefixConversion(postfix);
        
        Console.WriteLine("Prefix Expression: " + prefix + "\n");
        Console.WriteLine("Complexity: O(n)");
    }
}
