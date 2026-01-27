// Activity Selection Problem in Java

import java.util.*;

public class ActivitySelection {
    static class Activity implements Comparable<Activity> {
        int id, start, end;
        
        Activity(int id, int start, int end) {
            this.id = id;
            this.start = start;
            this.end = end;
        }
        
        public int compareTo(Activity other) {
            return this.end - other.end;
        }
    }
    
    public static void activitySelection(Activity[] activities) {
        Arrays.sort(activities);
        
        System.out.println("Selected Activities:");
        System.out.println("Activity " + activities[0].id + " (" + activities[0].start + " - " + activities[0].end + ")");
        
        int lastEnd = activities[0].end;
        int count = 1;
        
        for (int i = 1; i < activities.length; i++) {
            if (activities[i].start >= lastEnd) {
                System.out.println("Activity " + activities[i].id + " (" + activities[i].start + " - " + activities[i].end + ")");
                lastEnd = activities[i].end;
                count++;
            }
        }
        
        System.out.println("\nTotal Activities Selected: " + count);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Activity Selection Problem (Java) ===\n");
        
        Activity[] activities = {
            new Activity(1, 0, 5),
            new Activity(2, 1, 2),
            new Activity(3, 3, 4),
            new Activity(4, 0, 6),
            new Activity(5, 5, 7),
            new Activity(6, 8, 9)
        };
        
        System.out.println("Activities (ID, Start, End):");
        for (Activity a : activities) {
            System.out.println("Activity " + a.id + ": " + a.start + " - " + a.end);
        }
        System.out.println();
        
        activitySelection(activities);
        
        System.out.println("\n=== Greedy Strategy ===");
        System.out.println("1. Sort activities by end time");
        System.out.println("2. Select first activity");
        System.out.println("3. For remaining activities:");
        System.out.println("   - If start >= last end: select it");
        System.out.println("4. Repeat until all checked\n");
        
        System.out.println("=== Complexity ===");
        System.out.println("Time Complexity:  O(n log n) for sorting");
        System.out.println("Space Complexity: O(1)");
        System.out.println("Greedy Choice: Earliest finish time");
    }
}
