public class ArrayUpdate {
    // Array Update in Java
    // Modify/Update elements at specific positions
    
    static void updateElement(int[] arr, int position, int newValue) {
        arr[position] = newValue;
    }
    
    static void displayArray(int[] arr) {
        for (int val : arr) {
            System.out.print(val + " ");
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        int[] arr = {10, 20, 30, 40, 50};
        
        System.out.print("Original array: ");
        displayArray(arr);
        
        // Method 1: Direct update
        arr[0] = 15;
        System.out.print("After updating index 0 to 15: ");
        displayArray(arr);
        
        // Method 2: Using function
        updateElement(arr, 2, 35);
        System.out.print("After updating index 2 to 35: ");
        displayArray(arr);
        
        // Method 3: Conditional update
        arr = new int[]{10, 20, 30, 40, 50};
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] > 20) {
                arr[i] *= 2;
            }
        }
        System.out.print("After doubling elements > 20: ");
        displayArray(arr);
        
        // Method 4: Update all elements
        arr = new int[]{10, 20, 30, 40, 50};
        int addValue = 5;
        for (int i = 0; i < arr.length; i++) {
            arr[i] += addValue;
        }
        System.out.print("After adding 5 to all elements: ");
        displayArray(arr);
        
        // Method 5: Update using stream (Java 8+)
        arr = new int[]{10, 20, 30, 40, 50};
        for (int i = 0; i < arr.length; i++) {
            arr[i] = arr[i] * 2;
        }
        System.out.print("After doubling all elements: ");
        displayArray(arr);
    }
}
