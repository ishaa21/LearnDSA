// Max Heap in Java

import java.util.*;

public class MaxHeap {
    private List<Integer> arr;
    
    public MaxHeap() {
        this.arr = new ArrayList<>();
    }
    
    private int parent(int i) {
        return (i - 1) / 2;
    }
    
    private int leftChild(int i) {
        return 2 * i + 1;
    }
    
    private int rightChild(int i) {
        return 2 * i + 2;
    }
    
    private void swap(int i, int j) {
        int temp = arr.get(i);
        arr.set(i, arr.get(j));
        arr.set(j, temp);
    }
    
    private void heapifyUp(int i) {
        while (i > 0 && arr.get(parent(i)) < arr.get(i)) {
            swap(i, parent(i));
            i = parent(i);
        }
    }
    
    private void heapifyDown(int i) {
        int largest = i;
        int left = leftChild(i);
        int right = rightChild(i);
        
        if (left < arr.size() && arr.get(left) > arr.get(largest)) {
            largest = left;
        }
        if (right < arr.size() && arr.get(right) > arr.get(largest)) {
            largest = right;
        }
        
        if (largest != i) {
            swap(i, largest);
            heapifyDown(largest);
        }
    }
    
    public void insert(int key) {
        arr.add(key);
        heapifyUp(arr.size() - 1);
    }
    
    public int extractMax() {
        if (arr.isEmpty()) return -1;
        
        int max = arr.get(0);
        arr.set(0, arr.get(arr.size() - 1));
        arr.remove(arr.size() - 1);
        
        if (!arr.isEmpty()) {
            heapifyDown(0);
        }
        
        return max;
    }
    
    public int getMax() {
        return arr.isEmpty() ? -1 : arr.get(0);
    }
    
    public void printHeap() {
        System.out.println("Max Heap (Array): " + arr);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Max Heap (Java) ===\n");
        
        MaxHeap heap = new MaxHeap();
        
        System.out.println("Inserting: 5, 10, 3, 2, 8, 1");
        heap.insert(5);
        heap.insert(10);
        heap.insert(3);
        heap.insert(2);
        heap.insert(8);
        heap.insert(1);
        
        heap.printHeap();
        
        System.out.println("\nExtracting maximum elements:");
        System.out.println("Extract: " + heap.extractMax());
        heap.printHeap();
        System.out.println("Extract: " + heap.extractMax());
        heap.printHeap();
        
        System.out.println("\n=== Max Heap Properties ===");
        System.out.println("1. Parent >= Left Child");
        System.out.println("2. Parent >= Right Child");
        System.out.println("3. Complete binary tree (all levels filled except last)");
        System.out.println("4. Maximum element always at root\n");
        
        System.out.println("=== Max Heap Complexity ===");
        System.out.println("Insert:      O(log n)");
        System.out.println("Extract Max: O(log n)");
        System.out.println("Get Max:     O(1)");
        System.out.println("Space:       O(n)");
    }
}
