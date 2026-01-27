// Job Sequencing Problem in Java

import java.util.*;

public class JobSequencing {
    static class Job implements Comparable<Job> {
        int id, deadline, profit;
        
        Job(int id, int deadline, int profit) {
            this.id = id;
            this.deadline = deadline;
            this.profit = profit;
        }
        
        public int compareTo(Job other) {
            return other.profit - this.profit;
        }
    }
    
    public static void jobSequencing(Job[] jobs) {
        Arrays.sort(jobs);
        
        int n = jobs.length;
        int[] slot = new int[n];
        Arrays.fill(slot, -1);
        
        int totalProfit = 0;
        int jobsSelected = 0;
        
        for (Job job : jobs) {
            for (int j = job.deadline - 1; j >= 0; j--) {
                if (j < n && slot[j] == -1) {
                    slot[j] = job.id;
                    totalProfit += job.profit;
                    jobsSelected++;
                    break;
                }
            }
        }
        
        System.out.println("Selected Jobs (in execution order):");
        for (int i = 0; i < n; i++) {
            if (slot[i] != -1) {
                System.out.println("Slot " + (i + 1) + ": Job " + slot[i]);
            }
        }
        
        System.out.println("\nTotal Jobs: " + jobsSelected);
        System.out.println("Total Profit: " + totalProfit);
    }
    
    public static void main(String[] args) {
        System.out.println("=== Job Sequencing Problem (Java) ===\n");
        
        Job[] jobs = {
            new Job(1, 4, 20),
            new Job(2, 1, 10),
            new Job(3, 1, 40),
            new Job(4, 1, 30),
            new Job(5, 3, 35)
        };
        
        System.out.println("Jobs (ID, Deadline, Profit):");
        for (Job job : jobs) {
            System.out.println("Job " + job.id + ": Deadline " + job.deadline + ", Profit " + job.profit);
        }
        System.out.println();
        
        jobSequencing(jobs);
        
        System.out.println("\n=== Greedy Strategy ===");
        System.out.println("1. Sort jobs by profit (descending)");
        System.out.println("2. For each job:");
        System.out.println("   - Find latest available slot before deadline");
        System.out.println("   - If slot found: schedule job there");
        System.out.println("3. Calculate total profit\n");
        
        System.out.println("=== Complexity ===");
        System.out.println("Time Complexity:  O(n²) worst case");
        System.out.println("Space Complexity: O(n)");
        System.out.println("Optimal: Yes (greedy optimal for this problem)");
    }
}
