import java.util.Arrays;
import java.util.ArrayList;

// Array Deletion in Java
// Remove an element from a specific position

public class ArrayDeletion {
    
    static void deleteElement(int[] arr, int n, int position) {
        // Shift elements to the left
        for (int i = position; i < n - 1; i++) {
            arr[i] = arr[i + 1];
        }
    }
    
    static void displayArray(int[] arr, int n) {
        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        // Method 1: Using array
        int[] arr = {10, 20, 30, 40, 50};
        int n = 5;
        
        System.out.print("Original array: ");
        displayArray(arr, n);
        
        // Delete from beginning
        deleteElement(arr, n, 0);
        n--;
        System.out.print("After deleting first element: ");
        displayArray(arr, n);
        
        // Method 2: Using ArrayList
        ArrayList<Integer> list = new ArrayList<Integer>();
        list.add(10);
        list.add(20);
        list.add(30);
        list.add(40);
        list.add(50);
        
        System.out.println("Original ArrayList: " + list);
        
        // Delete at position
        list.remove(0);
        System.out.println("After removing element at position 0: " + list);
        
        // Delete by value
        list.remove(Integer.valueOf(30));
        System.out.println("After removing value 30: " + list);
        
        // Delete from end
        list.remove(list.size() - 1);
        System.out.println("After removing last element: " + list);
    }
}
