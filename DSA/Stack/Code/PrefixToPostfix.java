// Prefix to Postfix in Java

import java.util.Stack;

public class PrefixToPostfix {
    static boolean isOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/');
    }
    
    static String prefixToPostfix(String prefix) {
        Stack<String> stack = new Stack<>();
        int len = prefix.length();
        
        for (int i = len - 1; i >= 0; i--) {
            char c = prefix.charAt(i);
            
            if (isOperator(c)) {
                String op1 = stack.pop();
                String op2 = stack.pop();
                
                String temp = op1 + op2 + c;
                stack.push(temp);
            } else {
                stack.push(String.valueOf(c));
            }
        }
        
        return stack.pop();
    }
    
    public static void main(String[] args) {
        String prefix = "-+ab*cd";
        
        System.out.println("=== Prefix to Postfix ===\n");
        System.out.println("Prefix Expression: " + prefix);
        
        String postfix = prefixToPostfix(prefix);
        
        System.out.println("Postfix Expression: " + postfix + "\n");
        System.out.println("Complexity: O(n)");
    }
}
