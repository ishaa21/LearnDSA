public class IntroductionToArrays {
    // Introduction to Arrays in Java
    // Arrays are fixed-size collections of elements of the same type
    
    public static void main(String[] args) {
        // Array declaration and initialization
        int[] arr = {10, 20, 30, 40, 50};
        
        // Accessing elements
        System.out.println("First element: " + arr[0]);
        System.out.println("Last element: " + arr[arr.length - 1]);
        
        // Iterating through array
        System.out.print("All elements: ");
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
        
        // Array length
        System.out.println("Array length: " + arr.length);
    }
}
