// Postfix to Infix in Java

import java.util.Stack;

public class PostfixToInfix {
    static boolean isOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/');
    }
    
    static String postfixToInfix(String postfix) {
        Stack<String> stack = new Stack<>();
        
        for (char c : postfix.toCharArray()) {
            if (isOperator(c)) {
                String op2 = stack.pop();
                String op1 = stack.pop();
                
                String temp = "(" + op1 + c + op2 + ")";
                stack.push(temp);
            } else {
                stack.push(String.valueOf(c));
            }
        }
        
        return stack.pop();
    }
    
    public static void main(String[] args) {
        String postfix = "ab+cd*-";
        
        System.out.println("=== Postfix to Infix ===\n");
        System.out.println("Postfix Expression: " + postfix);
        
        String infix = postfixToInfix(postfix);
        
        System.out.println("Infix Expression: " + infix + "\n");
        System.out.println("Complexity: O(n)");
    }
}
