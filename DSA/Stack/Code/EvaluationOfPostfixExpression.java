// Evaluation of Postfix Expression in Java

import java.util.Stack;

public class EvaluationOfPostfixExpression {
    static int evaluate(int a, int b, char op) {
        switch(op) {
            case '+': return a + b;
            case '-': return a - b;
            case '*': return a * b;
            case '/': return a / b;
            case '^': return (int)Math.pow(a, b);
        }
        return 0;
    }
    
    static boolean isOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
    }
    
    static int evaluatePostfix(String postfix) {
        Stack<Integer> stack = new Stack<>();
        
        for (char c : postfix.toCharArray()) {
            if (Character.isDigit(c)) {
                stack.push(c - '0');
            } else if (isOperator(c)) {
                int b = stack.pop();
                int a = stack.pop();
                stack.push(evaluate(a, b, c));
            }
        }
        
        return stack.pop();
    }
    
    public static void main(String[] args) {
        String postfix = "23+4*5-";
        
        System.out.println("=== Evaluation of Postfix Expression ===\n");
        System.out.println("Postfix Expression: " + postfix);
        System.out.println("Result: " + evaluatePostfix(postfix) + "\n");
        
        System.out.println("Steps (23+4*5-):");
        System.out.println("1. Push 2");
        System.out.println("2. Push 3");
        System.out.println("3. Pop 3,2; Compute 2+3=5; Push 5");
        System.out.println("4. Push 4");
        System.out.println("5. Pop 4,5; Compute 5*4=20; Push 20");
        System.out.println("6. Push 5");
        System.out.println("7. Pop 5,20; Compute 20-5=15; Push 15\n");
        
        System.out.println("Complexity: O(n)");
    }
}
