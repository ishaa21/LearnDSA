// Infix to Prefix in Java

import java.util.Stack;

public class InfixToPrefix {
    static int precedence(char c) {
        if (c == '+' || c == '-') return 1;
        if (c == '*' || c == '/') return 2;
        if (c == '^') return 3;
        return 0;
    }
    
    static boolean isOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
    }
    
    static String infixToPrefix(String infix) {
        // Reverse the string
        infix = new StringBuilder(infix).reverse().toString();
        
        // Swap ( and )
        infix = infix.replace('(', 'T').replace(')', '(').replace('T', ')');
        
        // Convert to postfix
        Stack<Character> stack = new Stack<>();
        StringBuilder postfix = new StringBuilder();
        
        for (char c : infix.toCharArray()) {
            if (Character.isLetterOrDigit(c)) {
                postfix.append(c);
            } else if (c == '(') {
                stack.push(c);
            } else if (c == ')') {
                while (!stack.isEmpty() && stack.peek() != '(') {
                    postfix.append(stack.pop());
                }
                stack.pop();
            } else if (isOperator(c)) {
                while (!stack.isEmpty() && precedence(stack.peek()) >= precedence(c)) {
                    postfix.append(stack.pop());
                }
                stack.push(c);
            }
        }
        
        while (!stack.isEmpty()) {
            postfix.append(stack.pop());
        }
        
        // Reverse result
        return postfix.reverse().toString();
    }
    
    public static void main(String[] args) {
        String infix = "a+b*c-d/e";
        
        System.out.println("=== Infix to Prefix ===\n");
        System.out.println("Algorithm: Reverse -> Convert to Postfix -> Reverse");
        System.out.println("Steps:");
        System.out.println("1. Reverse the infix expression");
        System.out.println("2. Swap ( and )");
        System.out.println("3. Convert to postfix");
        System.out.println("4. Reverse result\n");
        
        System.out.println("Infix: " + infix);
        System.out.println("Prefix: " + infixToPrefix(infix) + "\n");
        System.out.println("Complexity: O(n)");
    }
}
