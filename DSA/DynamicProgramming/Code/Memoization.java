// Memoization Example in Java

public class Memoization {
    static int fib(int n, int[] dp) {
        if (n <= 1) return n;
        if (dp[n] != -1) return dp[n];
        return dp[n] = fib(n-1, dp) + fib(n-2, dp);
    }
    public static void main(String[] args) {
        System.out.println("=== Memoization Example (Java) ===\n");
        int n = 10;
        int[] dp = new int[100];
        for (int i = 0; i < 100; i++) dp[i] = -1;
        System.out.println("Fibonacci(" + n + ") = " + fib(n, dp));
        System.out.println("\nTime Complexity: O(n)");
        System.out.println("Space Complexity: O(n)");
    }
}
