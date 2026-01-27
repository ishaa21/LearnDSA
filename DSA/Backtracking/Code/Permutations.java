// Permutations using Backtracking in Java

public class Permutations {
    static void permute(int[] arr, int l, int r) {
        if (l == r) {
            System.out.print("[");
            for (int i = 0; i <= r; i++)
                System.out.print(arr[i] + (i==r?"":", "));
            System.out.println("]");
            return;
        }
        for (int i = l; i <= r; i++) {
            int t = arr[l]; arr[l] = arr[i]; arr[i] = t;
            permute(arr, l+1, r);
            t = arr[l]; arr[l] = arr[i]; arr[i] = t;
        }
    }
    public static void main(String[] args) {
        System.out.println("=== Permutations (Java) ===\n");
        int[] arr = {1, 2, 3};
        permute(arr, 0, arr.length-1);
        System.out.println("\nTime Complexity: O(n! * n)");
        System.out.println("Space Complexity: O(n)");
    }
}
