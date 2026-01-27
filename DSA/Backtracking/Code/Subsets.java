// Subsets using Backtracking in Java

public class Subsets {
    static void printSubset(int[] arr, int idx, int[] subset, int subsetSize) {
        if (idx == arr.length) {
            System.out.print("[");
            for (int i = 0; i < subsetSize; i++)
                System.out.print(subset[i] + (i+1==subsetSize?"":", "));
            System.out.println("]");
            return;
        }
        // Include arr[idx]
        subset[subsetSize] = arr[idx];
        printSubset(arr, idx+1, subset, subsetSize+1);
        // Exclude arr[idx]
        printSubset(arr, idx+1, subset, subsetSize);
    }
    public static void main(String[] args) {
        System.out.println("=== Subsets (Java) ===\n");
        int[] arr = {1, 2, 3};
        int[] subset = new int[10];
        printSubset(arr, 0, subset, 0);
        System.out.println("\nTime Complexity: O(2^n * n)");
        System.out.println("Space Complexity: O(n)");
    }
}
