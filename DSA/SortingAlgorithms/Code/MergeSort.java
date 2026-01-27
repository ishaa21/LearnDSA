import java.util.Arrays;

// Merge Sort in Java
// Divide and conquer algorithm - divide array in half, sort, and merge

public class MergeSort {
    
    static void merge(int arr[], int left, int mid, int right) {
        int n1 = mid - left + 1;
        int n2 = right - mid;
        
        int leftArr[] = new int[n1];
        int rightArr[] = new int[n2];
        
        for (int i = 0; i < n1; i++)
            leftArr[i] = arr[left + i];
        for (int i = 0; i < n2; i++)
            rightArr[i] = arr[mid + 1 + i];
        
        int i = 0, j = 0, k = left;
        
        while (i < n1 && j < n2) {
            if (leftArr[i] <= rightArr[j]) {
                arr[k++] = leftArr[i++];
            } else {
                arr[k++] = rightArr[j++];
            }
        }
        
        while (i < n1)
            arr[k++] = leftArr[i++];
        
        while (j < n2)
            arr[k++] = rightArr[j++];
    }
    
    static void mergeSort(int arr[], int left, int right) {
        if (left < right) {
            int mid = left + (right - left) / 2;
            
            mergeSort(arr, left, mid);
            mergeSort(arr, mid + 1, right);
            merge(arr, left, mid, right);
        }
    }
    
    static void displayArray(int arr[]) {
        System.out.println(Arrays.toString(arr));
    }
    
    public static void main(String[] args) {
        // Test 1: Basic merge sort
        int arr[] = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("Original Array: ");
        displayArray(arr);
        
        mergeSort(arr, 0, arr.length - 1);
        System.out.println("Sorted Array (Merge Sort): ");
        displayArray(arr);
        
        // Test 2: Already sorted
        int arr2[] = {1, 2, 3, 4, 5};
        System.out.println("\nAlready sorted: ");
        displayArray(arr2);
        mergeSort(arr2, 0, arr2.length - 1);
        System.out.println("After Merge Sort: ");
        displayArray(arr2);
        
        // Test 3: Reverse sorted
        int arr3[] = {5, 4, 3, 2, 1};
        System.out.println("\nReverse sorted: ");
        displayArray(arr3);
        mergeSort(arr3, 0, arr3.length - 1);
        System.out.println("After Merge Sort: ");
        displayArray(arr3);
        
        // Test 4: Duplicates
        int arr4[] = {5, 2, 8, 2, 9, 1, 5, 5};
        System.out.println("\nArray with duplicates: ");
        displayArray(arr4);
        mergeSort(arr4, 0, arr4.length - 1);
        System.out.println("After Merge Sort: ");
        displayArray(arr4);
        
        // Test 5: Single element
        int arr5[] = {42};
        System.out.println("\nSingle element: ");
        displayArray(arr5);
        mergeSort(arr5, 0, arr5.length - 1);
        System.out.println("After Merge Sort: ");
        displayArray(arr5);
        
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(n log n) - Linearithmic");
        System.out.println("Space Complexity: O(n) - Requires temporary arrays");
        System.out.println("Best Case: O(n log n)");
        System.out.println("Worst Case: O(n log n)");
        System.out.println("Average Case: O(n log n)");
        System.out.println("Stable: Yes");
        System.out.println("Note: Divide and conquer approach, consistent performance");
    }
}
