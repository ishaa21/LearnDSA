import java.util.Arrays;

// Insertion Sort in Java
// Build sorted array one item at a time by inserting elements at correct position

public class InsertionSort {
    
    static void insertionSort(int arr[]) {
        int n = arr.length;
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }
    
    static void insertionSortWithStats(int arr[]) {
        int n = arr.length;
        int comparisons = 0, shifts = 0;
        
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            
            while (j >= 0 && arr[j] > key) {
                comparisons++;
                arr[j + 1] = arr[j];
                shifts++;
                j--;
            }
            comparisons++;
            arr[j + 1] = key;
        }
        
        System.out.println("Comparisons: " + comparisons + ", Shifts: " + shifts);
    }
    
    static void insertionSortDescending(int arr[]) {
        int n = arr.length;
        for (int i = 1; i < n; i++) {
            int key = arr[i];
            int j = i - 1;
            
            while (j >= 0 && arr[j] < key) {  // Changed for descending
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }
    
    static void displayArray(int arr[]) {
        System.out.println(Arrays.toString(arr));
    }
    
    public static void main(String[] args) {
        // Test 1: Basic insertion sort
        int arr[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("Original Array: ");
        displayArray(arr);
        
        insertionSort(arr);
        System.out.println("Sorted Array: ");
        displayArray(arr);
        
        // Test 2: With statistics
        int arr2[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("\nInsertion Sort with statistics:");
        insertionSortWithStats(arr2);
        displayArray(arr2);
        
        // Test 3: Already sorted
        int arr3[] = {1, 2, 3, 4, 5};
        System.out.println("\nAlready sorted: ");
        displayArray(arr3);
        insertionSort(arr3);
        System.out.println("After Insertion Sort: ");
        displayArray(arr3);
        
        // Test 4: Reverse sorted
        int arr4[] = {5, 4, 3, 2, 1};
        System.out.println("\nReverse sorted: ");
        displayArray(arr4);
        insertionSort(arr4);
        System.out.println("After Insertion Sort: ");
        displayArray(arr4);
        
        // Test 5: Descending order
        int arr5[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("\nDescending order:");
        insertionSortDescending(arr5);
        displayArray(arr5);
        
        // Test 6: Duplicates
        int arr6[] = {5, 2, 8, 2, 9, 1, 5, 5};
        System.out.println("\nArray with duplicates: ");
        displayArray(arr6);
        insertionSort(arr6);
        System.out.println("After Insertion Sort: ");
        displayArray(arr6);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(n^2) - Quadratic");
        System.out.println("Space Complexity: O(1) - In-place");
        System.out.println("Best Case: O(n) - Already sorted");
        System.out.println("Worst Case: O(n^2) - Reverse sorted");
        System.out.println("Average Case: O(n^2)");
        System.out.println("Stable: Yes");
        System.out.println("Adaptive: Yes - performs well on nearly sorted data");
    }
}
