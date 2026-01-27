public class ArrayDeclarationInitialization {
    // Array Declaration & Initialization in Java
    // Different ways to declare and initialize arrays
    
    public static void main(String[] args) {
        // Method 1: Array with initialization
        int[] arr1 = {1, 2, 3, 4, 5};
        
        // Method 2: Array declaration with size
        int[] arr2 = new int[5];
        
        // Method 3: Initialize after declaration
        int[] arr3 = new int[3];
        arr3[0] = 10;
        arr3[1] = 20;
        arr3[2] = 30;
        
        // Method 4: String array
        String[] arr4 = {"Java", "C++", "Python", "C#"};
        
        // Method 5: 2D array
        int[][] arr5 = new int[3][3];
        
        // Method 6: 2D array with initialization
        int[][] arr6 = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
        
        System.out.print("arr1: ");
        for (int val : arr1) System.out.print(val + " ");
        System.out.println();
        
        System.out.print("arr3 (manual init): ");
        for (int val : arr3) System.out.print(val + " ");
        System.out.println();
        
        System.out.print("arr4 (String array): ");
        for (String val : arr4) System.out.print(val + " ");
        System.out.println();
    }
}
