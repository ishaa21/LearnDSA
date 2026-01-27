// Linear Search in Java
// Search for an element by checking each element sequentially

public class LinearSearch {
    
    static int linearSearch(int arr[], int target) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target)
                return i;  // Return index if found
        }
        return -1;  // Return -1 if not found
    }
    
    static int[] linearSearchAll(int arr[], int target) {
        java.util.List<Integer> indices = new java.util.ArrayList<>();
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target)
                indices.add(i);
        }
        int[] result = new int[indices.size()];
        for (int i = 0; i < indices.size(); i++)
            result[i] = indices.get(i);
        return result;
    }
    
    static void displayArray(int arr[]) {
        System.out.print("Array: ");
        for (int num : arr)
            System.out.print(num + " ");
        System.out.println();
    }
    
    public static void main(String[] args) {
        int arr[] = {64, 34, 25, 12, 22, 11, 90};
        
        displayArray(arr);
        
        // Test 1: Search for existing element
        int target = 22;
        System.out.println("\nSearching for " + target + ": ");
        int result = linearSearch(arr, target);
        if (result != -1)
            System.out.println("Found at index " + result);
        else
            System.out.println("Not found");
        
        // Test 2: Search for first element
        target = 64;
        System.out.println("Searching for " + target + ": ");
        result = linearSearch(arr, target);
        if (result != -1)
            System.out.println("Found at index " + result);
        else
            System.out.println("Not found");
        
        // Test 3: Search for last element
        target = 90;
        System.out.println("Searching for " + target + ": ");
        result = linearSearch(arr, target);
        if (result != -1)
            System.out.println("Found at index " + result);
        else
            System.out.println("Not found");
        
        // Test 4: Search for non-existing element
        target = 100;
        System.out.println("Searching for " + target + ": ");
        result = linearSearch(arr, target);
        if (result != -1)
            System.out.println("Found at index " + result);
        else
            System.out.println("Not found");
        
        // Test 5: Find all occurrences
        int arr2[] = {10, 20, 30, 20, 40, 20};
        displayArray(arr2);
        target = 20;
        int[] indices = linearSearchAll(arr2, target);
        System.out.print("All occurrences of " + target + ": ");
        for (int idx : indices)
            System.out.print(idx + " ");
        System.out.println();
        
        // Complexity Analysis
        System.out.println("\nComplexity Analysis:");
        System.out.println("Time Complexity: O(n) - Linear");
        System.out.println("Space Complexity: O(1) - Constant");
        System.out.println("Best Case: O(1) - Element at first position");
        System.out.println("Worst Case: O(n) - Element at last position or not found");
    }
}
