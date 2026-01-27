// Evaluation of Infix Expression in Java

import java.util.Stack;

public class EvaluationOfInfixExpression {
    static int precedence(char c) {
        if (c == '+' || c == '-') return 1;
        if (c == '*' || c == '/') return 2;
        if (c == '^') return 3;
        return 0;
    }
    
    static int evaluate(int a, int b, char op) {
        switch(op) {
            case '+': return a + b;
            case '-': return a - b;
            case '*': return a * b;
            case '/': return a / b;
        }
        return 0;
    }
    
    static int evaluateInfix(String infix) {
        Stack<Integer> nums = new Stack<>();
        Stack<Character> ops = new Stack<>();
        
        for (char c : infix.toCharArray()) {
            if (Character.isDigit(c)) {
                nums.push(c - '0');
            } else if (c == '(') {
                ops.push(c);
            } else if (c == ')') {
                while (!ops.isEmpty() && ops.peek() != '(') {
                    char op = ops.pop();
                    int b = nums.pop();
                    int a = nums.pop();
                    nums.push(evaluate(a, b, op));
                }
                ops.pop(); // Remove '('
            } else if (c == '+' || c == '-' || c == '*' || c == '/') {
                while (!ops.isEmpty() && ops.peek() != '(' && 
                       precedence(ops.peek()) >= precedence(c)) {
                    char op = ops.pop();
                    int b = nums.pop();
                    int a = nums.pop();
                    nums.push(evaluate(a, b, op));
                }
                ops.push(c);
            }
        }
        
        while (!ops.isEmpty()) {
            char op = ops.pop();
            int b = nums.pop();
            int a = nums.pop();
            nums.push(evaluate(a, b, op));
        }
        
        return nums.pop();
    }
    
    public static void main(String[] args) {
        String infix = "2+3*4-5";
        
        System.out.println("=== Evaluation of Infix Expression ===\n");
        System.out.println("Infix Expression: " + infix);
        System.out.println("Result: " + evaluateInfix(infix) + "\n");
        
        System.out.println("Operator Precedence: * / > + -");
        System.out.println("Complexity: O(n)");
    }
}
