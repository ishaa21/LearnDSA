// Activity Selection Problem in C#

using System;
using System.Collections.Generic;
using System.Linq;

class ActivitySelection {
    class Activity : IComparable<Activity> {
        public int Id { get; set; }
        public int Start { get; set; }
        public int End { get; set; }
        
        public Activity(int id, int start, int end) {
            Id = id;
            Start = start;
            End = end;
        }
        
        public int CompareTo(Activity other) {
            return this.End - other.End;
        }
    }
    
    public static void ActivitySelectionProblem(List<Activity> activities) {
        activities.Sort();
        
        Console.WriteLine("Selected Activities:");
        Console.WriteLine($"Activity {activities[0].Id} ({activities[0].Start} - {activities[0].End})");
        
        int lastEnd = activities[0].End;
        int count = 1;
        
        for (int i = 1; i < activities.Count; i++) {
            if (activities[i].Start >= lastEnd) {
                Console.WriteLine($"Activity {activities[i].Id} ({activities[i].Start} - {activities[i].End})");
                lastEnd = activities[i].End;
                count++;
            }
        }
        
        Console.WriteLine($"\nTotal Activities Selected: {count}");
    }
    
    static void Main() {
        Console.WriteLine("=== Activity Selection Problem (C#) ===\n");
        
        List<Activity> activities = new List<Activity> {
            new Activity(1, 0, 5),
            new Activity(2, 1, 2),
            new Activity(3, 3, 4),
            new Activity(4, 0, 6),
            new Activity(5, 5, 7),
            new Activity(6, 8, 9)
        };
        
        Console.WriteLine("Activities (ID, Start, End):");
        foreach (var a in activities) {
            Console.WriteLine($"Activity {a.Id}: {a.Start} - {a.End}");
        }
        Console.WriteLine();
        
        ActivitySelectionProblem(activities);
        
        Console.WriteLine("\n=== Greedy Strategy ===");
        Console.WriteLine("1. Sort activities by end time");
        Console.WriteLine("2. Select first activity");
        Console.WriteLine("3. For remaining activities:");
        Console.WriteLine("   - If start >= last end: select it");
        Console.WriteLine("4. Repeat until all checked\n");
        
        Console.WriteLine("=== Complexity ===");
        Console.WriteLine("Time Complexity:  O(n log n) for sorting");
        Console.WriteLine("Space Complexity: O(1)");
        Console.WriteLine("Greedy Choice: Earliest finish time");
    }
}
