import java.util.Arrays;

// Counting Sort in Java
// Non-comparison sort - counts occurrences of each element

public class CountingSort {
    
    static void countingSort(int arr[]) {
        if (arr.length == 0) return;
        
        int maxVal = arr[0];
        int minVal = arr[0];
        
        for (int num : arr) {
            if (num > maxVal) maxVal = num;
            if (num < minVal) minVal = num;
        }
        
        int range = maxVal - minVal + 1;
        int count[] = new int[range];
        
        for (int num : arr)
            count[num - minVal]++;
        
        for (int i = 1; i < range; i++)
            count[i] += count[i - 1];
        
        int output[] = new int[arr.length];
        for (int i = arr.length - 1; i >= 0; i--) {
            output[count[arr[i] - minVal] - 1] = arr[i];
            count[arr[i] - minVal]--;
        }
        
        for (int i = 0; i < arr.length; i++)
            arr[i] = output[i];
    }
    
    static void countingSortRange(int arr[], int maxVal) {
        int count[] = new int[maxVal + 1];
        
        for (int num : arr)
            count[num]++;
        
        int index = 0;
        for (int i = 0; i <= maxVal; i++) {
            for (int j = 0; j < count[i]; j++) {
                arr[index++] = i;
            }
        }
    }
    
    static void displayArray(int arr[]) {
        System.out.println(Arrays.toString(arr));
    }
    
    public static void main(String[] args) {
        // Test 1: Basic counting sort
        int arr[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("Original Array: ");
        displayArray(arr);
        
        countingSort(arr);
        System.out.println("Sorted Array (Counting Sort): ");
        displayArray(arr);
        
        // Test 2: Small range
        int arr2[] = {4, 2, 3, 4, 1, 2, 4};
        System.out.println("\nSmall range array: ");
        displayArray(arr2);
        countingSortRange(arr2, 4);
        System.out.println("After Counting Sort: ");
        displayArray(arr2);
        
        // Test 3: Duplicates
        int arr3[] = {5, 2, 8, 2, 9, 1, 5, 5};
        System.out.println("\nArray with duplicates: ");
        displayArray(arr3);
        countingSort(arr3);
        System.out.println("After Counting Sort: ");
        displayArray(arr3);
        
        // Test 4: Already sorted
        int arr4[] = {1, 2, 3, 4, 5};
        System.out.println("\nAlready sorted: ");
        displayArray(arr4);
        countingSort(arr4);
        System.out.println("After Counting Sort: ");
        displayArray(arr4);
        
        // Test 5: Reverse sorted
        int arr5[] = {5, 4, 3, 2, 1};
        System.out.println("\nReverse sorted: ");
        displayArray(arr5);
        countingSort(arr5);
        System.out.println("After Counting Sort: ");
        displayArray(arr5);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(n + k) where k is range of input");
        System.out.println("Space Complexity: O(k)");
        System.out.println("Best Case: O(n + k)");
        System.out.println("Worst Case: O(n + k)");
        System.out.println("Average Case: O(n + k)");
        System.out.println("Stable: Yes");
        System.out.println("Note: Non-comparison, efficient for small ranges");
    }
}
