# Job Sequencing Problem in Python

class Job:
    def __init__(self, id, deadline, profit):
        self.id = id
        self.deadline = deadline
        self.profit = profit

def job_sequencing(jobs):
    # Sort by profit (descending)
    jobs.sort(key=lambda x: x.profit, reverse=True)
    
    n = len(jobs)
    slot = [-1] * n
    
    total_profit = 0
    jobs_selected = 0
    
    for job in jobs:
        for j in range(job.deadline - 1, -1, -1):
            if j < n and slot[j] == -1:
                slot[j] = job.id
                total_profit += job.profit
                jobs_selected += 1
                break
    
    print("Selected Jobs (in execution order):")
    for i in range(n):
        if slot[i] != -1:
            print(f"Slot {i + 1}: Job {slot[i]}")
    
    print(f"\nTotal Jobs: {jobs_selected}")
    print(f"Total Profit: {total_profit}")

# Test
print("=== Job Sequencing Problem (Python) ===\n")

jobs = [
    Job(1, 4, 20),
    Job(2, 1, 10),
    Job(3, 1, 40),
    Job(4, 1, 30),
    Job(5, 3, 35)
]

print("Jobs (ID, Deadline, Profit):")
for job in jobs:
    print(f"Job {job.id}: Deadline {job.deadline}, Profit {job.profit}")
print()

job_sequencing(jobs)

print("\n=== Greedy Strategy ===")
print("1. Sort jobs by profit (descending)")
print("2. For each job:")
print("   - Find latest available slot before deadline")
print("   - If slot found: schedule job there")
print("3. Calculate total profit\n")

print("=== Complexity ===")
print("Time Complexity:  O(n²) worst case")
print("Space Complexity: O(n)")
print("Optimal: Yes (greedy optimal for this problem)")
