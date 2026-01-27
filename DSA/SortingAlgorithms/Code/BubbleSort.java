import java.util.Arrays;

// Bubble Sort in Java
// Repeatedly swap adjacent elements if they are in wrong order

public class BubbleSort {
    
    static void bubbleSort(int arr[]) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
    
    static void bubbleSortOptimized(int arr[]) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            boolean swapped = false;
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }
            if (!swapped) break;
        }
    }
    
    static void bubbleSortDescending(int arr[]) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] < arr[j + 1]) {  // Changed for descending
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
    
    static void displayArray(int arr[]) {
        System.out.println(Arrays.toString(arr));
    }
    
    public static void main(String[] args) {
        // Test 1: Basic bubble sort
        int arr[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("Original Array: ");
        displayArray(arr);
        
        bubbleSort(arr);
        System.out.println("Sorted (Bubble Sort): ");
        displayArray(arr);
        
        // Test 2: Optimized version
        int arr2[] = {64, 34, 25, 12, 22, 11, 90};
        bubbleSortOptimized(arr2);
        System.out.println("\nSorted (Optimized): ");
        displayArray(arr2);
        
        // Test 3: Already sorted
        int arr3[] = {1, 2, 3, 4, 5};
        System.out.println("\nAlready sorted: ");
        displayArray(arr3);
        bubbleSortOptimized(arr3);
        System.out.println("After Bubble Sort: ");
        displayArray(arr3);
        
        // Test 4: Reverse sorted
        int arr4[] = {5, 4, 3, 2, 1};
        System.out.println("\nReverse sorted: ");
        displayArray(arr4);
        bubbleSort(arr4);
        System.out.println("After Bubble Sort: ");
        displayArray(arr4);
        
        // Test 5: Descending order
        int arr5[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("\nDescending order sorting:");
        bubbleSortDescending(arr5);
        displayArray(arr5);
        
        // Test 6: Duplicates
        int arr6[] = {5, 2, 8, 2, 9, 1, 5, 5};
        System.out.println("\nArray with duplicates: ");
        displayArray(arr6);
        bubbleSortOptimized(arr6);
        System.out.println("After Bubble Sort: ");
        displayArray(arr6);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(n^2) - Quadratic");
        System.out.println("Space Complexity: O(1) - In-place");
        System.out.println("Best Case: O(n) - Already sorted (optimized)");
        System.out.println("Worst Case: O(n^2) - Reverse sorted");
        System.out.println("Stable: Yes");
    }
}
