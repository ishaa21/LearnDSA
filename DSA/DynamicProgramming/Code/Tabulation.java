// Tabulation Example in Java

public class Tabulation {
    static int fib(int n) {
        int[] dp = new int[100];
        dp[0] = 0;
        dp[1] = 1;
        for (int i = 2; i <= n; i++) {
            dp[i] = dp[i-1] + dp[i-2];
        }
        return dp[n];
    }
    public static void main(String[] args) {
        System.out.println("=== Tabulation Example (Java) ===\n");
        int n = 10;
        System.out.println("Fibonacci(" + n + ") = " + fib(n));
        System.out.println("\nTime Complexity: O(n)");
        System.out.println("Space Complexity: O(n)");
    }
}
