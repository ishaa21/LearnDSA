// Evaluation of Prefix Expression in Java

import java.util.Stack;

public class EvaluationOfPrefixExpression {
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
    
    static int evaluatePrefix(String prefix) {
        Stack<Integer> stack = new Stack<>();
        int len = prefix.length();
        
        for (int i = len - 1; i >= 0; i--) {
            char c = prefix.charAt(i);
            
            if (Character.isDigit(c)) {
                stack.push(c - '0');
            } else if (isOperator(c)) {
                int a = stack.pop();
                int b = stack.pop();
                stack.push(evaluate(a, b, c));
            }
        }
        
        return stack.pop();
    }
    
    public static void main(String[] args) {
        String prefix = "-*+2345";
        
        System.out.println("=== Evaluation of Prefix Expression ===\n");
        System.out.println("Prefix Expression: " + prefix);
        System.out.println("Result: " + evaluatePrefix(prefix) + "\n");
        
        System.out.println("Steps (-*+2345):");
        System.out.println("1. Process 5: Push 5");
        System.out.println("2. Process 4: Push 4");
        System.out.println("3. Process 3: Push 3");
        System.out.println("4. Process +: Pop 3,4; Compute 3+4=7; Push 7");
        System.out.println("5. Process 2: Push 2");
        System.out.println("6. Process *: Pop 2,7; Compute 2*7=14; Push 14");
        System.out.println("7. Process -: Pop 14,5; Compute 14-5=9; Push 9\n");
        
        System.out.println("Complexity: O(n)");
    }
}
