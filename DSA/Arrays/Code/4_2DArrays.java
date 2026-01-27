public class TwoDArrays {
    // 2D Arrays in Java
    // Two dimensional arrays are matrix-like structures
    
    public static void main(String[] args) {
        // Declaration and initialization
        int[][] arr = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };
        
        // Accessing elements
        System.out.println("Element at [0][0]: " + arr[0][0]);
        System.out.println("Element at [1][2]: " + arr[1][2]);
        System.out.println("Element at [2][1]: " + arr[2][1]);
        
        // Iterating through 2D array and printing
        System.out.println("2D Array:");
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
                System.out.print(arr[i][j] + " ");
            }
            System.out.println();
        }
        
        // Modifying element
        arr[1][1] = 10;
        System.out.println("After modification, arr[1][1] = " + arr[1][1]);
        
        // Calculating sum of all elements
        int sum = 0;
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
                sum += arr[i][j];
            }
        }
        System.out.println("Sum of all elements: " + sum);
    }
}
