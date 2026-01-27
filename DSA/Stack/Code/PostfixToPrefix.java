// Postfix to Prefix in Java

import java.util.Stack;

public class PostfixToPrefix {
    static boolean isOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/');
    }
    
    static String postfixToPrefix(String postfix) {
        Stack<String> stack = new Stack<>();
        
        for (char c : postfix.toCharArray()) {
            if (isOperator(c)) {
                String op2 = stack.pop();
                String op1 = stack.pop();
                
                String temp = c + op1 + op2;
                stack.push(temp);
            } else {
                stack.push(String.valueOf(c));
            }
        }
        
        return stack.pop();
    }
    
    public static void main(String[] args) {
        String postfix = "ab+cd*-";
        
        System.out.println("=== Postfix to Prefix ===\n");
        System.out.println("Postfix Expression: " + postfix);
        
        String prefix = postfixToPrefix(postfix);
        
        System.out.println("Prefix Expression: " + prefix + "\n");
        System.out.println("Complexity: O(n)");
    }
}
