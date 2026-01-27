import java.util.Arrays;

// Searching in Arrays in Java
// Linear Search and Binary Search implementations

public class SearchingInArrays {
    
    // Linear Search
    static int linearSearch(int[] arr, int target) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target)
                return i;
        }
        return -1;
    }
    
    // Binary Search
    static int binarySearch(int[] arr, int target) {
        int left = 0, right = arr.length - 1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (arr[mid] == target)
                return mid;
            else if (arr[mid] < target)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return -1;
    }
    
    public static void main(String[] args) {
        int[] arr = {10, 20, 30, 40, 50, 60, 70};
        int target = 40;
        
        // Linear Search
        System.out.print("Linear Search for " + target + ": ");
        int pos = linearSearch(arr, target);
        if (pos != -1)
            System.out.println("Found at index " + pos);
        else
            System.out.println("Not found");
        
        // Linear Search for non-existing element
        target = 25;
        System.out.print("Linear Search for " + target + ": ");
        pos = linearSearch(arr, target);
        if (pos != -1)
            System.out.println("Found at index " + pos);
        else
            System.out.println("Not found");
        
        // Binary Search
        target = 50;
        System.out.print("Binary Search for " + target + ": ");
        pos = binarySearch(arr, target);
        if (pos != -1)
            System.out.println("Found at index " + pos);
        else
            System.out.println("Not found");
        
        // Using Java's built-in method
        target = 30;
        System.out.print("Using Arrays.binarySearch for " + target + ": ");
        pos = Arrays.binarySearch(arr, target);
        if (pos >= 0)
            System.out.println("Found at index " + pos);
        else
            System.out.println("Not found");
    }
}
