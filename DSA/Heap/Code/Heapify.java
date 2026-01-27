// Heapify in Java

import java.util.*;

public class Heapify {
    private static void swap(int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    
    private static int leftChild(int i) {
        return 2 * i + 1;
    }
    
    private static int rightChild(int i) {
        return 2 * i + 2;
    }
    
    public static void minHeapify(int[] arr, int n, int i) {
        int smallest = i;
        int left = leftChild(i);
        int right = rightChild(i);
        
        if (left < n && arr[left] < arr[smallest]) {
            smallest = left;
        }
        if (right < n && arr[right] < arr[smallest]) {
            smallest = right;
        }
        
        if (smallest != i) {
            swap(arr, i, smallest);
            minHeapify(arr, n, smallest);
        }
    }
    
    public static void maxHeapify(int[] arr, int n, int i) {
        int largest = i;
        int left = leftChild(i);
        int right = rightChild(i);
        
        if (left < n && arr[left] > arr[largest]) {
            largest = left;
        }
        if (right < n && arr[right] > arr[largest]) {
            largest = right;
        }
        
        if (largest != i) {
            swap(arr, i, largest);
            maxHeapify(arr, n, largest);
        }
    }
    
    public static void buildMinHeap(int[] arr) {
        int n = arr.length;
        for (int i = n / 2 - 1; i >= 0; i--) {
            minHeapify(arr, n, i);
        }
    }
    
    public static void buildMaxHeap(int[] arr) {
        int n = arr.length;
        for (int i = n / 2 - 1; i >= 0; i--) {
            maxHeapify(arr, n, i);
        }
    }
    
    public static void printArray(int[] arr) {
        for (int val : arr) {
            System.out.print(val + " ");
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        System.out.println("=== Heapify (Java) ===\n");
        
        int[] arr1 = {4, 10, 3, 5, 1, 2, 8};
        System.out.print("Original Array: ");
        printArray(arr1);
        
        System.out.println("\nBuilding Min Heap:");
        buildMinHeap(arr1);
        System.out.print("Min Heap: ");
        printArray(arr1);
        
        int[] arr2 = {4, 10, 3, 5, 1, 2, 8};
        System.out.println("\nBuilding Max Heap:");
        buildMaxHeap(arr2);
        System.out.print("Max Heap: ");
        printArray(arr2);
        
        System.out.println("\n=== Heapify Algorithm ===");
        System.out.println("1. Start from last non-leaf node (index n/2 - 1)");
        System.out.println("2. Call heapify for each node from bottom to top");
        System.out.println("3. Heapify moves element down to correct position");
        System.out.println("4. Recursively heapify affected subtrees\n");
        
        System.out.println("=== Heapify Complexity ===");
        System.out.println("Time Complexity:  O(n)");
        System.out.println("Space Complexity: O(log n) for recursion");
        System.out.println("Applications: Heap Sort, Priority Queue construction");
    }
}
