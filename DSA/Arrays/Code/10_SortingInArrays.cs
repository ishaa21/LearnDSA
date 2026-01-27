using System;
using System.Linq;

// Sorting in Arrays in C#
// Bubble Sort, Selection Sort, and built-in sort

class SortingInArrays {
    
    // Bubble Sort
    static void BubbleSort(int[] arr) {
        int n = arr.Length;
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
    static void SelectionSort(int[] arr) {
        int n = arr.Length;
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
    
    static void DisplayArray(int[] arr) {
        Console.WriteLine(string.Join(" ", arr));
    }
    
    static void Main() {
        int[] arr1 = {64, 34, 25, 12, 22, 11, 90};
        int[] arr2 = {64, 34, 25, 12, 22, 11, 90};
        int[] arr3 = {64, 34, 25, 12, 22, 11, 90};
        
        Console.Write("Original array: ");
        DisplayArray(arr1);
        
        // Bubble Sort
        BubbleSort(arr1);
        Console.Write("After Bubble Sort: ");
        DisplayArray(arr1);
        
        // Selection Sort
        SelectionSort(arr2);
        Console.Write("After Selection Sort: ");
        DisplayArray(arr2);
        
        // Using C#'s built-in sort
        Array.Sort(arr3);
        Console.Write("After Array.Sort(): ");
        DisplayArray(arr3);
    }
}
