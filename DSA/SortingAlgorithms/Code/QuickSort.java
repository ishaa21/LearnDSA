import java.util.Arrays;
import java.util.Random;

// Quick Sort in Java
// Divide and conquer algorithm using pivot element partitioning

public class QuickSort {
    
    static int partition(int arr[], int low, int high) {
        int pivot = arr[high];
        int i = low - 1;
        
        for (int j = low; j < high; j++) {
            if (arr[j] < pivot) {
                i++;
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
        
        int temp = arr[i + 1];
        arr[i + 1] = arr[high];
        arr[high] = temp;
        
        return i + 1;
    }
    
    static int partitionRandom(int arr[], int low, int high) {
        Random random = new Random();
        int randomIdx = low + random.nextInt(high - low + 1);
        
        int temp = arr[randomIdx];
        arr[randomIdx] = arr[high];
        arr[high] = temp;
        
        return partition(arr, low, high);
    }
    
    static void quickSort(int arr[], int low, int high) {
        if (low < high) {
            int pi = partition(arr, low, high);
            
            quickSort(arr, low, pi - 1);
            quickSort(arr, pi + 1, high);
        }
    }
    
    static void quickSortRandom(int arr[], int low, int high) {
        if (low < high) {
            int pi = partitionRandom(arr, low, high);
            
            quickSortRandom(arr, low, pi - 1);
            quickSortRandom(arr, pi + 1, high);
        }
    }
    
    static void displayArray(int arr[]) {
        System.out.println(Arrays.toString(arr));
    }
    
    public static void main(String[] args) {
        // Test 1: Basic quick sort
        int arr[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("Original Array: ");
        displayArray(arr);
        
        quickSort(arr, 0, arr.length - 1);
        System.out.println("Sorted Array (Quick Sort - Last as pivot): ");
        displayArray(arr);
        
        // Test 2: With random pivot
        int arr2[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("\nSorting with random pivot:\n");
        quickSortRandom(arr2, 0, arr2.length - 1);
        displayArray(arr2);
        
        // Test 3: Already sorted
        int arr3[] = {1, 2, 3, 4, 5};
        System.out.println("\nAlready sorted: ");
        displayArray(arr3);
        quickSort(arr3, 0, arr3.length - 1);
        System.out.println("After Quick Sort: ");
        displayArray(arr3);
        
        // Test 4: Reverse sorted
        int arr4[] = {5, 4, 3, 2, 1};
        System.out.println("\nReverse sorted: ");
        displayArray(arr4);
        quickSort(arr4, 0, arr4.length - 1);
        System.out.println("After Quick Sort: ");
        displayArray(arr4);
        
        // Test 5: Duplicates
        int arr5[] = {5, 2, 8, 2, 9, 1, 5, 5};
        System.out.println("\nArray with duplicates: ");
        displayArray(arr5);
        quickSort(arr5, 0, arr5.length - 1);
        System.out.println("After Quick Sort: ");
        displayArray(arr5);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(n log n) - Average, O(n^2) - Worst");
        System.out.println("Space Complexity: O(log n) - Due to recursion stack");
        System.out.println("Best Case: O(n log n)");
        System.out.println("Worst Case: O(n^2) - Already sorted or reverse sorted");
        System.out.println("Average Case: O(n log n)");
        System.out.println("Stable: No (not stable)");
        System.out.println("Note: In-place sorting, efficient on large datasets");
    }
}
