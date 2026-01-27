// Postfix to Infix in C#

using System;
using System.Collections.Generic;

class PostfixToInfix {
    static bool IsOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/');
    }
    
    static string PostfixToInfixConversion(string postfix) {
        Stack<string> stack = new Stack<string>();
        
        foreach (char c in postfix) {
            if (IsOperator(c)) {
                string op2 = stack.Pop();
                string op1 = stack.Pop();
                
                string temp = "(" + op1 + c + op2 + ")";
                stack.Push(temp);
            } else {
                stack.Push(c.ToString());
            }
        }
        
        return stack.Pop();
    }
    
    static void Main() {
        string postfix = "ab+cd*-";
        
        Console.WriteLine("=== Postfix to Infix ===\n");
        Console.WriteLine("Postfix Expression: " + postfix);
        
        string infix = PostfixToInfixConversion(postfix);
        
        Console.WriteLine("Infix Expression: " + infix + "\n");
        Console.WriteLine("Complexity: O(n)");
    }
}
