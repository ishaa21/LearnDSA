// Combinations using Backtracking in Java

public class Combinations {
    static void combine(int[] arr, int r, int idx, int[] data, int i) {
        if (idx == r) {
            System.out.print("[");
            for (int j = 0; j < r; j++)
                System.out.print(data[j] + (j+1==r?"":", "));
            System.out.println("]");
            return;
        }
        if (i >= arr.length) return;
        data[idx] = arr[i];
        combine(arr, r, idx+1, data, i+1);
        combine(arr, r, idx, data, i+1);
    }
    public static void main(String[] args) {
        System.out.println("=== Combinations (Java) ===\n");
        int[] arr = {1, 2, 3, 4};
        int r = 2;
        int[] data = new int[10];
        combine(arr, r, 0, data, 0);
        System.out.println("\nTime Complexity: O(C(n, r) * r)");
        System.out.println("Space Complexity: O(r)");
    }
}
