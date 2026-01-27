// Valid Parentheses in C#

using System;
using System.Collections.Generic;

class ValidParentheses {
    static bool IsValidParentheses(string str) {
        Stack<char> stack = new Stack<char>();
        
        foreach (char c in str) {
            if (c == '(' || c == '{' || c == '[') {
                stack.Push(c);
            } else if (c == ')' || c == '}' || c == ']') {
                if (stack.Count == 0) return false;
                
                char top = stack.Pop();
                
                if ((c == ')' && top != '(') ||
                    (c == '}' && top != '{') ||
                    (c == ']' && top != '[')) {
                    return false;
                }
            }
        }
        
        return stack.Count == 0;
    }
    
    static void Main() {
        Console.WriteLine("=== Valid Parentheses ===\n");
        
        string[] tests = {
            "()",
            "(){}[]",
            "([{}])",
            "([)]",
            "{[}",
            "(((",
            ")"
        };
        
        foreach (string test in tests) {
            Console.WriteLine("Expression: " + test + " -> " + 
                            (IsValidParentheses(test) ? "Valid" : "Invalid"));
        }
        
        Console.WriteLine("\nComplexity: O(n)");
        Console.WriteLine("Space: O(n)");
    }
}
