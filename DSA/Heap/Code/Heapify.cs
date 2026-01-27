// Heapify in C#

using System;
using System.Collections.Generic;

class Heapify {
    private static void Swap(int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    
    private static int LeftChild(int i) {
        return 2 * i + 1;
    }
    
    private static int RightChild(int i) {
        return 2 * i + 2;
    }
    
    public static void MinHeapify(int[] arr, int n, int i) {
        int smallest = i;
        int left = LeftChild(i);
        int right = RightChild(i);
        
        if (left < n && arr[left] < arr[smallest]) {
            smallest = left;
        }
        if (right < n && arr[right] < arr[smallest]) {
            smallest = right;
        }
        
        if (smallest != i) {
            Swap(arr, i, smallest);
            MinHeapify(arr, n, smallest);
        }
    }
    
    public static void MaxHeapify(int[] arr, int n, int i) {
        int largest = i;
        int left = LeftChild(i);
        int right = RightChild(i);
        
        if (left < n && arr[left] > arr[largest]) {
            largest = left;
        }
        if (right < n && arr[right] > arr[largest]) {
            largest = right;
        }
        
        if (largest != i) {
            Swap(arr, i, largest);
            MaxHeapify(arr, n, largest);
        }
    }
    
    public static void BuildMinHeap(int[] arr) {
        int n = arr.Length;
        for (int i = n / 2 - 1; i >= 0; i--) {
            MinHeapify(arr, n, i);
        }
    }
    
    public static void BuildMaxHeap(int[] arr) {
        int n = arr.Length;
        for (int i = n / 2 - 1; i >= 0; i--) {
            MaxHeapify(arr, n, i);
        }
    }
    
    public static void PrintArray(int[] arr) {
        foreach (int val in arr) {
            Console.Write(val + " ");
        }
        Console.WriteLine();
    }
    
    static void Main() {
        Console.WriteLine("=== Heapify (C#) ===\n");
        
        int[] arr1 = {4, 10, 3, 5, 1, 2, 8};
        Console.Write("Original Array: ");
        PrintArray(arr1);
        
        Console.WriteLine("\nBuilding Min Heap:");
        BuildMinHeap(arr1);
        Console.Write("Min Heap: ");
        PrintArray(arr1);
        
        int[] arr2 = {4, 10, 3, 5, 1, 2, 8};
        Console.WriteLine("\nBuilding Max Heap:");
        BuildMaxHeap(arr2);
        Console.Write("Max Heap: ");
        PrintArray(arr2);
        
        Console.WriteLine("\n=== Heapify Algorithm ===");
        Console.WriteLine("1. Start from last non-leaf node (index n/2 - 1)");
        Console.WriteLine("2. Call heapify for each node from bottom to top");
        Console.WriteLine("3. Heapify moves element down to correct position");
        Console.WriteLine("4. Recursively heapify affected subtrees\n");
        
        Console.WriteLine("=== Heapify Complexity ===");
        Console.WriteLine("Time Complexity:  O(n)");
        Console.WriteLine("Space Complexity: O(log n) for recursion");
        Console.WriteLine("Applications: Heap Sort, Priority Queue construction");
    }
}
