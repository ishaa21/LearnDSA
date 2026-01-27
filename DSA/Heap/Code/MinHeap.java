// Min Heap in Java

import java.util.*;

public class MinHeap {
    private List<Integer> arr;
    
    public MinHeap() {
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
        while (i > 0 && arr.get(parent(i)) > arr.get(i)) {
            swap(i, parent(i));
            i = parent(i);
        }
    }
    
    private void heapifyDown(int i) {
        int smallest = i;
        int left = leftChild(i);
        int right = rightChild(i);
        
        if (left < arr.size() && arr.get(left) < arr.get(smallest)) {
            smallest = left;
        }
        if (right < arr.size() && arr.get(right) < arr.get(smallest)) {
            smallest = right;
        }
        
        if (smallest != i) {
            swap(i, smallest);
            heapifyDown(smallest);
        }
    }
    
    public void insert(int key) {
        arr.add(key);
        heapifyUp(arr.size() - 1);
    }
    
    public int extractMin() {
        if (arr.isEmpty()) return -1;
        
        int min = arr.get(0);
        arr.set(0, arr.get(arr.size() - 1));
        arr.remove(arr.size() - 1);
        
        if (!arr.isEmpty()) {
            heapifyDown(0);
        }
        
        return min;
    }
    
    public int getMin() {
        return arr.isEmpty() ? -1 : arr.get(0);
    }
    
    public void printHeap() {
        System.out.println("Min Heap (Array): " + arr);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Min Heap (Java) ===\n");
        
        MinHeap heap = new MinHeap();
        
        System.out.println("Inserting: 10, 5, 3, 2, 8, 1");
        heap.insert(10);
        heap.insert(5);
        heap.insert(3);
        heap.insert(2);
        heap.insert(8);
        heap.insert(1);
        
        heap.printHeap();
        
        System.out.println("\nExtracting minimum elements:");
        System.out.println("Extract: " + heap.extractMin());
        heap.printHeap();
        System.out.println("Extract: " + heap.extractMin());
        heap.printHeap();
        
        System.out.println("\n=== Min Heap Properties ===");
        System.out.println("1. Parent <= Left Child");
        System.out.println("2. Parent <= Right Child");
        System.out.println("3. Complete binary tree (all levels filled except last)");
        System.out.println("4. Minimum element always at root\n");
        
        System.out.println("=== Min Heap Complexity ===");
        System.out.println("Insert:      O(log n)");
        System.out.println("Extract Min: O(log n)");
        System.out.println("Get Min:     O(1)");
        System.out.println("Space:       O(n)");
    }
}
