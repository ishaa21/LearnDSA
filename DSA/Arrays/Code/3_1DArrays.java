public class OneDArrays {
    // 1D Arrays in Java
    // Single dimensional arrays store elements linearly
    
    public static void main(String[] args) {
        // Declaration and initialization
        int[] arr = {10, 20, 30, 40, 50};
        
        // Accessing elements
        System.out.println("Element at index 0: " + arr[0]);
        System.out.println("Element at index 2: " + arr[2]);
        
        // Modifying elements
        arr[1] = 25;
        System.out.println("Modified element at index 1: " + arr[1]);
        
        // Iterating and printing all elements
        System.out.print("All elements: ");
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
        
        // Finding sum
        int sum = 0;
        for (int i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        System.out.println("Sum of all elements: " + sum);
        
        // Finding average
        double average = (double) sum / arr.length;
        System.out.println("Average: " + average);
    }
}
