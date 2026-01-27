// LIS (DP) in Java

public class LIS {
    static int[] lis(int[] arr) {
        int n = arr.length;
        int[] dp = new int[n];       // dp[i] = length of LIS ending at i
        int[] parent = new int[n];   // parent[i] = previous index in LIS

        for (int i = 0; i < n; i++) {
            dp[i] = 1;
            parent[i] = -1;
        }

        int res = 1, lastIndex = 0;

        // Build dp and parent arrays
        for (int i = 1; i < n; i++) {
            for (int j = 0; j < i; j++) {
                if (arr[i] > arr[j] && dp[i] < dp[j] + 1) {
                    dp[i] = dp[j] + 1;
                    parent[i] = j;
                }
            }
            if (dp[i] > res) {
                res = dp[i];
                lastIndex = i;
            }
        }

        // Reconstruct LIS
        int[] lis = new int[res];
        int k = res - 1;
        while (lastIndex != -1) {
            lis[k--] = arr[lastIndex];
            lastIndex = parent[lastIndex];
        }

        return lis;
    }

    public static void main(String[] args) {
        System.out.println("=== LIS (Java) ===\n");
        int[] arr = {10, 22, 9, 33, 21, 50, 41, 60};

        int[] subsequence = lis(arr);

        System.out.println("Length of LIS: " + subsequence.length);
        System.out.print("LIS: ");
        for (int num : subsequence) {
            System.out.print(num + " ");
        }
        System.out.println();

        System.out.println("\nTime Complexity: O(n^2)");
        System.out.println("Space Complexity: O(n)");
    }
}