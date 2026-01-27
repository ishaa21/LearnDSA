// Valid Parentheses in Java

import java.util.Stack;

public class ValidParentheses {
    static boolean isValidParentheses(String str) {
        Stack<Character> stack = new Stack<>();
        
        for (char c : str.toCharArray()) {
            if (c == '(' || c == '{' || c == '[') {
                stack.push(c);
            } else if (c == ')' || c == '}' || c == ']') {
                if (stack.isEmpty()) return false;
                
                char top = stack.pop();
                
                if ((c == ')' && top != '(') ||
                    (c == '}' && top != '{') ||
                    (c == ']' && top != '[')) {
                    return false;
                }
            }
        }
        
        return stack.isEmpty();
    }
    
    public static void main(String[] args) {
        System.out.println("=== Valid Parentheses ===\n");
        
        String[] tests = {
            "()",
            "(){}[]",
            "([{}])",
            "([)]",
            "{[}",
            "(((",
            ")"
        };
        
        for (String test : tests) {
            System.out.println("Expression: " + test + " -> " + 
                             (isValidParentheses(test) ? "Valid" : "Invalid"));
        }
        
        System.out.println("\nComplexity: O(n)");
        System.out.println("Space: O(n)");
    }
}
