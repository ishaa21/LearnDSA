import java.util.Arrays;

// Sorting in Arrays in Java
// Bubble Sort, Selection Sort, and built-in sort

public class SortingInArrays {
    
    // Bubble Sort
    static void bubbleSort(int[] arr) {
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
    
    // Selection Sort
    static void selectionSort(int[] arr) {
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
    
    public static void main(String[] args) {
        int[] arr1 = {64, 34, 25, 12, 22, 11, 90};
        int[] arr2 = {64, 34, 25, 12, 22, 11, 90};
        int[] arr3 = {64, 34, 25, 12, 22, 11, 90};
        
        System.out.println("Original array: " + Arrays.toString(arr1));
        
        // Bubble Sort
        bubbleSort(arr1);
        System.out.println("After Bubble Sort: " + Arrays.toString(arr1));
        
        // Selection Sort
        selectionSort(arr2);
        System.out.println("After Selection Sort: " + Arrays.toString(arr2));
        
        // Using Java's built-in sort
        Arrays.sort(arr3);
        System.out.println("After Arrays.sort(): " + Arrays.toString(arr3));
    }
}
