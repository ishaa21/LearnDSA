import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;

// Array Insertion in Java
// Insert an element at a specific position

public class ArrayInsertion {
    
    // Function to insert element in array
    static void insertElement(int[] arr, int n, int position, int value) {
        // Shift elements to the right
        for (int i = n - 1; i >= position; i--) {
            arr[i + 1] = arr[i];
        }
        // Insert new element
        arr[position] = value;
    }
    
    static void displayArray(int[] arr, int n) {
        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        // Method 1: Using array (fixed size)
        int[] arr = new int[10];
        int n = 5;
        arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40; arr[4] = 50;
        
        System.out.print("Original array: ");
        displayArray(arr, n);
        
        // Insert at beginning
        insertElement(arr, n, 0, 5);
        n++;
        System.out.print("After inserting 5 at beginning: ");
        displayArray(arr, n);
        
        // Method 2: Using ArrayList (dynamic size)
        ArrayList<Integer> list = new ArrayList<Integer>();
        list.add(10);
        list.add(20);
        list.add(30);
        list.add(40);
        list.add(50);
        
        System.out.println("Original ArrayList: " + list);
        
        // Insert at position
        list.add(2, 25);
        System.out.println("After inserting 25 at position 2: " + list);
        
        // Insert at beginning
        list.add(0, 5);
        System.out.println("After inserting 5 at beginning: " + list);
    }
}
