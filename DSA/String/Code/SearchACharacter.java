// Search a Character in a String in Java
// Find position and count of a character

public class SearchACharacter {
    public static void main(String[] args) {
        String str = "Hello World";
        char target = 'l';
        
        // Method 1: Using indexOf() - finds first occurrence
        System.out.println("Using indexOf():");
        int pos = str.indexOf(target);
        if (pos != -1) {
            System.out.println("Character '" + target + "' found at index: " + pos);
        } else {
            System.out.println("Character '" + target + "' not found");
        }
        
        // Method 2: Using lastIndexOf() - finds last occurrence
        System.out.println("\nUsing lastIndexOf():");
        int lastPos = str.lastIndexOf(target);
        if (lastPos != -1) {
            System.out.println("Last occurrence of '" + target + "' at index: " + lastPos);
        }
        
        // Method 3: Manual search with loop
        System.out.println("\nManual search - all occurrences:");
        int count = 0;
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == target) {
                System.out.println("Found at index: " + i);
                count++;
            }
        }
        System.out.println("Total occurrences: " + count);
        
        // Method 4: Finding from specific position
        System.out.println("\nSearching from position 5:");
        int index = str.indexOf(target, 5);
        while (index != -1) {
            System.out.println("Found at index: " + index);
            index = str.indexOf(target, index + 1);
        }
        
        // Method 5: Using toCharArray()
        System.out.println("\nUsing toCharArray():");
        char[] chars = str.toCharArray();
        int total = 0;
        for (char c : chars) {
            if (c == target) {
                total++;
            }
        }
        System.out.println("Total count of '" + target + "': " + total);
        
        // Method 6: Case-insensitive search
        System.out.println("\nCase-insensitive search for 'W':");
        String lowerStr = str.toLowerCase();
        char lowerTarget = Character.toLowerCase('W');
        int caseCount = 0;
        for (char c : lowerStr.toCharArray()) {
            if (c == lowerTarget) {
                caseCount++;
            }
        }
        System.out.println("Case-insensitive count: " + caseCount);
    }
}
