#include <stdio.h>
#include <stdlib.h>

typedef struct Job {
    int id;
    int deadline;
    int profit;
} Job;

int compare(const void* a, const void* b) {
    return ((Job*)b)->profit - ((Job*)a)->profit;
}

void jobSequencing(Job* jobs, int n) {
    qsort(jobs, n, sizeof(Job), compare);
    
    int* slot = (int*)malloc(n * sizeof(int));
    int* result = (int*)malloc(n * sizeof(int));
    
    for (int i = 0; i < n; i++) {
        slot[i] = 0;
        result[i] = -1;
    }
    
    int totalProfit = 0;
    int jobsSelected = 0;
    
    for (int i = 0; i < n; i++) {
        for (int j = jobs[i].deadline - 1; j >= 0; j--) {
            if (j < n && !slot[j]) {
                result[j] = jobs[i].id;
                slot[j] = 1;
                totalProfit += jobs[i].profit;
                jobsSelected++;
                break;
            }
        }
    }
    
    printf("Selected Jobs (in execution order):\n");
    for (int i = 0; i < n; i++) {
        if (result[i] != -1) {
            printf("Slot %d: Job %d\n", i + 1, result[i]);
        }
    }
    
    printf("\nTotal Jobs: %d\n", jobsSelected);
    printf("Total Profit: %d\n", totalProfit);
    
    free(slot);
    free(result);
}

int main() {
    printf("=== Job Sequencing Problem (C) ===\n\n");
    
    Job jobs[] = {
        {1, 4, 20},
        {2, 1, 10},
        {3, 1, 40},
        {4, 1, 30},
        {5, 3, 35}
    };
    int n = 5;
    
    printf("Jobs (ID, Deadline, Profit):\n");
    for (int i = 0; i < n; i++) {
        printf("Job %d: Deadline %d, Profit %d\n", jobs[i].id, jobs[i].deadline, jobs[i].profit);
    }
    printf("\n");
    
    jobSequencing(jobs, n);
    
    printf("\n=== Greedy Strategy ===\n");
    printf("1. Sort jobs by profit (descending)\n");
    printf("2. For each job:\n");
    printf("   - Find latest available slot before deadline\n");
    printf("   - If slot found: schedule job there\n");
    printf("3. Calculate total profit\n\n");
    
    printf("=== Complexity ===\n");
    printf("Time Complexity:  O(n²) worst case\n");
    printf("Space Complexity: O(n)\n");
    printf("Optimal: Yes (greedy optimal for this problem)\n");
    
    return 0;
}
