// Infix to Postfix in Java

public class InfixToPostfix {
    static int precedence(char c) {
        if (c == '+' || c == '-') return 1;
        if (c == '*' || c == '/') return 2;
        if (c == '^') return 3;
        return 0;
    }
    
    static boolean isOperator(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/' || c == '^');
    }
    
    static String infixToPostfix(String infix) {
        StringBuilder postfix = new StringBuilder();
        java.util.Stack<Character> stack = new java.util.Stack<>();
        
        for (char c : infix.toCharArray()) {
            if (Character.isLetterOrDigit(c)) {
                postfix.append(c);
            } else if (c == '(') {
                stack.push(c);
            } else if (c == ')') {
                while (!stack.isEmpty() && stack.peek() != '(') {
                    postfix.append(stack.pop());
                }
                stack.pop(); // Remove '('
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
        
        return postfix.toString();
    }
    
    public static void main(String[] args) {
        String infix = "a+b*c-d/e";
        
        System.out.println("=== Infix to Postfix ===\n");
        System.out.println("Infix Expression: " + infix);
        
        String postfix = infixToPostfix(infix);
        
        System.out.println("Postfix Expression: " + postfix + "\n");
        
        System.out.println("Algorithm: Shunting-yard");
        System.out.println("Complexity: O(n)");
    }
}
