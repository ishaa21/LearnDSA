public class ArrayTraversal {
    // Array Traversal in Java
    // Accessing and processing each element of an array
    
    public static void main(String[] args) {
        int[] arr = {10, 20, 30, 40, 50};
        
        // Method 1: Forward traversal using for loop
        System.out.println("Forward traversal:");
        for (int i = 0; i < arr.length; i++) {
            System.out.println("arr[" + i + "] = " + arr[i]);
        }
        
        // Method 2: Backward traversal
        System.out.println("\nBackward traversal:");
        for (int i = arr.length - 1; i >= 0; i--) {
            System.out.println("arr[" + i + "] = " + arr[i]);
        }
        
        // Method 3: Enhanced for loop (forEach)
        System.out.println("\nEnhanced for loop:");
        for (int val : arr) {
            System.out.println("Value: " + val);
        }
        
        // Method 4: While loop
        System.out.println("\nWhile loop traversal:");
        int i = 0;
        while (i < arr.length) {
            System.out.println("Value: " + arr[i]);
            i++;
        }
        
        // Method 5: Calculate sum
        int sum = 0;
        for (int val : arr) {
            sum += val;
        }
        System.out.println("\nSum of all elements: " + sum);
        
        // Method 6: Find maximum
        int max = arr[0];
        for (int val : arr) {
            if (val > max) max = val;
        }
        System.out.println("Maximum element: " + max);
    }
}
