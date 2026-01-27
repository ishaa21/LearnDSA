import java.util.Arrays;

// Heap Sort in Java
// Uses max heap to sort array in ascending order

public class HeapSort {
    
    static void heapify(int arr[], int n, int i) {
        int largest = i;
        int left = 2 * i + 1;
        int right = 2 * i + 2;
        
        if (left < n && arr[left] > arr[largest])
            largest = left;
        
        if (right < n && arr[right] > arr[largest])
            largest = right;
        
        if (largest != i) {
            int temp = arr[i];
            arr[i] = arr[largest];
            arr[largest] = temp;
            heapify(arr, n, largest);
        }
    }
    
    static void heapSort(int arr[]) {
        int n = arr.length;
        
        // Build max heap
        for (int i = n / 2 - 1; i >= 0; i--)
            heapify(arr, n, i);
        
        // Extract elements from heap
        for (int i = n - 1; i > 0; i--) {
            int temp = arr[0];
            arr[0] = arr[i];
            arr[i] = temp;
            heapify(arr, i, 0);
        }
    }
    
    static void displayArray(int arr[]) {
        System.out.println(Arrays.toString(arr));
    }
    
    public static void main(String[] args) {
        // Test 1: Basic heap sort
        int arr[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("Original Array: ");
        displayArray(arr);
        
        heapSort(arr);
        System.out.println("Sorted Array (Heap Sort): ");
        displayArray(arr);
        
        // Test 2: Already sorted
        int arr2[] = {1, 2, 3, 4, 5};
        System.out.println("\nAlready sorted: ");
        displayArray(arr2);
        heapSort(arr2);
        System.out.println("After Heap Sort: ");
        displayArray(arr2);
        
        // Test 3: Reverse sorted
        int arr3[] = {5, 4, 3, 2, 1};
        System.out.println("\nReverse sorted: ");
        displayArray(arr3);
        heapSort(arr3);
        System.out.println("After Heap Sort: ");
        displayArray(arr3);
        
        // Test 4: Duplicates
        int arr4[] = {5, 2, 8, 2, 9, 1, 5, 5};
        System.out.println("\nArray with duplicates: ");
        displayArray(arr4);
        heapSort(arr4);
        System.out.println("After Heap Sort: ");
        displayArray(arr4);
        
        // Test 5: Single element
        int arr5[] = {42};
        System.out.println("\nSingle element: ");
        displayArray(arr5);
        heapSort(arr5);
        System.out.println("After Heap Sort: ");
        displayArray(arr5);
        
        // Test 6: Two elements
        int arr6[] = {50, 30};
        System.out.println("\nTwo elements: ");
        displayArray(arr6);
        heapSort(arr6);
        System.out.println("After Heap Sort: ");
        displayArray(arr6);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(n log n) - Linearithmic");
        System.out.println("Space Complexity: O(1) - In-place");
        System.out.println("Best Case: O(n log n)");
        System.out.println("Worst Case: O(n log n)");
        System.out.println("Average Case: O(n log n)");
        System.out.println("Stable: No (not stable)");
        System.out.println("Note: In-place, guaranteed O(n log n), good for large datasets");
    }
}
