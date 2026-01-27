// Job Sequencing Problem in C#

using System;
using System.Collections.Generic;
using System.Linq;

class JobSequencing {
    class Job : IComparable<Job> {
        public int Id { get; set; }
        public int Deadline { get; set; }
        public int Profit { get; set; }
        
        public Job(int id, int deadline, int profit) {
            Id = id;
            Deadline = deadline;
            Profit = profit;
        }
        
        public int CompareTo(Job other) {
            return other.Profit - this.Profit;
        }
    }
    
    public static void JobSequencingProblem(List<Job> jobs) {
        jobs.Sort();
        
        int n = jobs.Count;
        int[] slot = new int[n];
        for (int i = 0; i < n; i++) slot[i] = -1;
        
        int totalProfit = 0;
        int jobsSelected = 0;
        
        foreach (Job job in jobs) {
            for (int j = job.Deadline - 1; j >= 0; j--) {
                if (j < n && slot[j] == -1) {
                    slot[j] = job.Id;
                    totalProfit += job.Profit;
                    jobsSelected++;
                    break;
                }
            }
        }
        
        Console.WriteLine("Selected Jobs (in execution order):");
        for (int i = 0; i < n; i++) {
            if (slot[i] != -1) {
                Console.WriteLine($"Slot {i + 1}: Job {slot[i]}");
            }
        }
        
        Console.WriteLine($"\nTotal Jobs: {jobsSelected}");
        Console.WriteLine($"Total Profit: {totalProfit}");
    }
    
    static void Main() {
        Console.WriteLine("=== Job Sequencing Problem (C#) ===\n");
        
        List<Job> jobs = new List<Job> {
            new Job(1, 4, 20),
            new Job(2, 1, 10),
            new Job(3, 1, 40),
            new Job(4, 1, 30),
            new Job(5, 3, 35)
        };
        
        Console.WriteLine("Jobs (ID, Deadline, Profit):");
        foreach (var job in jobs) {
            Console.WriteLine($"Job {job.Id}: Deadline {job.Deadline}, Profit {job.Profit}");
        }
        Console.WriteLine();
        
        JobSequencingProblem(jobs);
        
        Console.WriteLine("\n=== Greedy Strategy ===");
        Console.WriteLine("1. Sort jobs by profit (descending)");
        Console.WriteLine("2. For each job:");
        Console.WriteLine("   - Find latest available slot before deadline");
        Console.WriteLine("   - If slot found: schedule job there");
        Console.WriteLine("3. Calculate total profit\n");
        
        Console.WriteLine("=== Complexity ===");
        Console.WriteLine("Time Complexity:  O(n²) worst case");
        Console.WriteLine("Space Complexity: O(n)");
        Console.WriteLine("Optimal: Yes (greedy optimal for this problem)");
    }
}
