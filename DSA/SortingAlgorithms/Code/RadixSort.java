import java.util.Arrays;

// Radix Sort in Java
// Sorts by processing individual digits

public class RadixSort {
    
    static void countingSortForRadix(int arr[], int exp) {
        int n = arr.length;
        int output[] = new int[n];
        int count[] = new int[10];
        
        for (int i = 0; i < n; i++)
            count[(arr[i] / exp) % 10]++;
        
        for (int i = 1; i < 10; i++)
            count[i] += count[i - 1];
        
        for (int i = n - 1; i >= 0; i--) {
            int index = (arr[i] / exp) % 10;
            output[count[index] - 1] = arr[i];
            count[index]--;
        }
        
        for (int i = 0; i < n; i++)
            arr[i] = output[i];
    }
    
    static void radixSort(int arr[]) {
        if (arr.length == 0) return;
        
        int maxVal = arr[0];
        for (int num : arr) {
            if (num > maxVal)
                maxVal = num;
        }
        
        for (int exp = 1; maxVal / exp > 0; exp *= 10)
            countingSortForRadix(arr, exp);
    }
    
    static void displayArray(int arr[]) {
        System.out.println(Arrays.toString(arr));
    }
    
    public static void main(String[] args) {
        // Test 1: Basic radix sort
        int arr[] = {170, 45, 75, 90, 2, 802, 24, 2, 66};
        System.out.println("Original Array: ");
        displayArray(arr);
        
        radixSort(arr);
        System.out.println("Sorted Array (Radix Sort): ");
        displayArray(arr);
        
        // Test 2: Single digit
        int arr2[] = {5, 2, 8, 3, 9, 1, 4};
        System.out.println("\nSingle digit array: ");
        displayArray(arr2);
        radixSort(arr2);
        System.out.println("After Radix Sort: ");
        displayArray(arr2);
        
        // Test 3: Duplicates
        int arr3[] = {50, 25, 85, 25, 90, 10, 50, 50};
        System.out.println("\nArray with duplicates: ");
        displayArray(arr3);
        radixSort(arr3);
        System.out.println("After Radix Sort: ");
        displayArray(arr3);
        
        // Test 4: Already sorted
        int arr4[] = {10, 20, 30, 40, 50};
        System.out.println("\nAlready sorted: ");
        displayArray(arr4);
        radixSort(arr4);
        System.out.println("After Radix Sort: ");
        displayArray(arr4);
        
        // Test 5: Reverse sorted
        int arr5[] = {500, 400, 300, 200, 100};
        System.out.println("\nReverse sorted: ");
        displayArray(arr5);
        radixSort(arr5);
        System.out.println("After Radix Sort: ");
        displayArray(arr5);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(d * (n + k)) where d is number of digits");
        System.out.println("Space Complexity: O(n + k)");
        System.out.println("Best Case: O(d * n)");
        System.out.println("Worst Case: O(d * (n + k))");
        System.out.println("Average Case: O(d * (n + k))");
        System.out.println("Stable: Yes");
        System.out.println("Note: Works best for positive integers, efficient for large datasets");
    }
}
