class BinarySearch {
    int binarySearch(int arr[], int target) {
        int low = 0, high = arr.length - 1;
        while (low <= high) {
            int mid = low + (high - low) / 2;

            // Check if target is at mid
            if (arr[mid] == target)
                return mid;

            // If target is greater, ignore left half
            if (arr[mid] < target)
                low = mid + 1;

            // If target is smaller, ignore right half
            else
                high = mid - 1;
        }

        // Target was not found
        return -1;
    }

    public static void main(String args[]) {
        BinarySearch ob = new BinarySearch();
        int numbers[] = { 2, 5, 8, 12, 16, 23, 38, 56, 72, 91 };
        int target = 23;

        int result = ob.binarySearch(numbers, target);
        if (result == -1)
            System.out.println("Element not found");
        else
            System.out.println("Element found at index " + result);
    }
}
