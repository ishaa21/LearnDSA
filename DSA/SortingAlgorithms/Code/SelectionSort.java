import java.util.Arrays;

// Selection Sort in Java
// Find minimum element and place at beginning, repeat for remaining array

public class SelectionSort {
    
    static void selectionSort(int arr[]) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            int minIdx = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIdx])
                    minIdx = j;
            }
            int temp = arr[i];
            arr[i] = arr[minIdx];
            arr[minIdx] = temp;
        }
    }
    
    static void selectionSortWithStats(int arr[]) {
        int n = arr.length;
        int comparisons = 0, swaps = 0;
        
        for (int i = 0; i < n - 1; i++) {
            int minIdx = i;
            for (int j = i + 1; j < n; j++) {
                comparisons++;
                if (arr[j] < arr[minIdx])
                    minIdx = j;
            }
            if (minIdx != i) {
                int temp = arr[i];
                arr[i] = arr[minIdx];
                arr[minIdx] = temp;
                swaps++;
            }
        }
        
        System.out.println("Comparisons: " + comparisons + ", Swaps: " + swaps);
    }
    
    static void selectionSortDescending(int arr[]) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            int maxIdx = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] > arr[maxIdx])  // Changed for descending
                    maxIdx = j;
            }
            int temp = arr[i];
            arr[i] = arr[maxIdx];
            arr[maxIdx] = temp;
        }
    }
    
    static void displayArray(int arr[]) {
        System.out.println(Arrays.toString(arr));
    }
    
    public static void main(String[] args) {
        // Test 1: Basic selection sort
        int arr[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("Original Array: ");
        displayArray(arr);
        
        selectionSort(arr);
        System.out.println("Sorted Array: ");
        displayArray(arr);
        
        // Test 2: With statistics
        int arr2[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("\nSelection Sort with statistics:");
        selectionSortWithStats(arr2);
        displayArray(arr2);
        
        // Test 3: Already sorted
        int arr3[] = {1, 2, 3, 4, 5};
        System.out.println("\nAlready sorted: ");
        displayArray(arr3);
        selectionSort(arr3);
        System.out.println("After Selection Sort: ");
        displayArray(arr3);
        
        // Test 4: Reverse sorted
        int arr4[] = {5, 4, 3, 2, 1};
        System.out.println("\nReverse sorted: ");
        displayArray(arr4);
        selectionSort(arr4);
        System.out.println("After Selection Sort: ");
        displayArray(arr4);
        
        // Test 5: Descending order
        int arr5[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("\nDescending order:");
        selectionSortDescending(arr5);
        displayArray(arr5);
        
        // Test 6: Duplicates
        int arr6[] = {5, 2, 8, 2, 9, 1, 5, 5};
        System.out.println("\nArray with duplicates: ");
        displayArray(arr6);
        selectionSort(arr6);
        System.out.println("After Selection Sort: ");
        displayArray(arr6);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(n^2) - Quadratic");
        System.out.println("Space Complexity: O(1) - In-place");
        System.out.println("Best Case: O(n^2)");
        System.out.println("Worst Case: O(n^2)");
        System.out.println("Average Case: O(n^2)");
        System.out.println("Stable: No (not stable)");
        System.out.println("Number of swaps: At most n-1");
    }
}
