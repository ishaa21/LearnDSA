// Min Heap in C#

using System;
using System.Collections.Generic;

class MinHeap {
    private List<int> arr;
    
    public MinHeap() {
        arr = new List<int>();
    }
    
    private int Parent(int i) {
        return (i - 1) / 2;
    }
    
    private int LeftChild(int i) {
        return 2 * i + 1;
    }
    
    private int RightChild(int i) {
        return 2 * i + 2;
    }
    
    private void Swap(int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    
    private void HeapifyUp(int i) {
        while (i > 0 && arr[Parent(i)] > arr[i]) {
            Swap(i, Parent(i));
            i = Parent(i);
        }
    }
    
    private void HeapifyDown(int i) {
        int smallest = i;
        int left = LeftChild(i);
        int right = RightChild(i);
        
        if (left < arr.Count && arr[left] < arr[smallest]) {
            smallest = left;
        }
        if (right < arr.Count && arr[right] < arr[smallest]) {
            smallest = right;
        }
        
        if (smallest != i) {
            Swap(i, smallest);
            HeapifyDown(smallest);
        }
    }
    
    public void Insert(int key) {
        arr.Add(key);
        HeapifyUp(arr.Count - 1);
    }
    
    public int ExtractMin() {
        if (arr.Count == 0) return -1;
        
        int min = arr[0];
        arr[0] = arr[arr.Count - 1];
        arr.RemoveAt(arr.Count - 1);
        
        if (arr.Count > 0) {
            HeapifyDown(0);
        }
        
        return min;
    }
    
    public int GetMin() {
        return arr.Count == 0 ? -1 : arr[0];
    }
    
    public void PrintHeap() {
        Console.Write("Min Heap (Array): ");
        foreach (int val in arr) {
            Console.Write(val + " ");
        }
        Console.WriteLine();
    }
    
    static void Main() {
        Console.WriteLine("=== Min Heap (C#) ===\n");
        
        MinHeap heap = new MinHeap();
        
        Console.WriteLine("Inserting: 10, 5, 3, 2, 8, 1");
        heap.Insert(10);
        heap.Insert(5);
        heap.Insert(3);
        heap.Insert(2);
        heap.Insert(8);
        heap.Insert(1);
        
        heap.PrintHeap();
        
        Console.WriteLine("\nExtracting minimum elements:");
        Console.WriteLine("Extract: " + heap.ExtractMin());
        heap.PrintHeap();
        Console.WriteLine("Extract: " + heap.ExtractMin());
        heap.PrintHeap();
        
        Console.WriteLine("\n=== Min Heap Properties ===");
        Console.WriteLine("1. Parent <= Left Child");
        Console.WriteLine("2. Parent <= Right Child");
        Console.WriteLine("3. Complete binary tree (all levels filled except last)");
        Console.WriteLine("4. Minimum element always at root\n");
        
        Console.WriteLine("=== Min Heap Complexity ===");
        Console.WriteLine("Insert:      O(log n)");
        Console.WriteLine("Extract Min: O(log n)");
        Console.WriteLine("Get Min:     O(1)");
        Console.WriteLine("Space:       O(n)");
    }
}
