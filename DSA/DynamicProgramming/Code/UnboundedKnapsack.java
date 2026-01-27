// Unbounded Knapsack (DP) in Java

public class UnboundedKnapsack {
    static int unboundedKnapsack(int W, int wt[], int val[], int n) {
        int[] dp = new int[W+1];
        for (int w = 0; w <= W; w++) {
            for (int i = 0; i < n; i++) {
                if (wt[i] <= w)
                    dp[w] = Math.max(dp[w], dp[w-wt[i]] + val[i]);
            }
        }
        return dp[W];
    }
    public static void main(String[] args) {
        System.out.println("=== Unbounded Knapsack (Java) ===\n");
        int val[] = {10, 40, 50, 70};
        int wt[] = {1, 3, 4, 5};
        int W = 8;
        int n = 4;
        System.out.println("Max value: " + unboundedKnapsack(W, wt, val, n));
        System.out.println("\nTime Complexity: O(nW)");
        System.out.println("Space Complexity: O(W)");
    }
}
