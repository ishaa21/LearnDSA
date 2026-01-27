#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Job {
    int id, deadline, profit;
    
    bool operator<(const Job& other) const {
        return profit > other.profit;
    }
};

void jobSequencing(vector<Job>& jobs) {
    sort(jobs.begin(), jobs.end());
    
    int n = jobs.size();
    vector<int> slot(n, -1);
    
    int totalProfit = 0;
    int jobsSelected = 0;
    
    for (const auto& job : jobs) {
        for (int j = job.deadline - 1; j >= 0; j--) {
            if (j < n && slot[j] == -1) {
                slot[j] = job.id;
                totalProfit += job.profit;
                jobsSelected++;
                break;
            }
        }
    }
    
    cout << "Selected Jobs (in execution order):\n";
    for (int i = 0; i < n; i++) {
        if (slot[i] != -1) {
            cout << "Slot " << i + 1 << ": Job " << slot[i] << "\n";
        }
    }
    
    cout << "\nTotal Jobs: " << jobsSelected << "\n";
    cout << "Total Profit: " << totalProfit << "\n";
}

int main() {
    cout << "=== Job Sequencing Problem (C++) ===\n\n";
    
    vector<Job> jobs = {
        {1, 4, 20},
        {2, 1, 10},
        {3, 1, 40},
        {4, 1, 30},
        {5, 3, 35}
    };
    
    cout << "Jobs (ID, Deadline, Profit):\n";
    for (const auto& job : jobs) {
        cout << "Job " << job.id << ": Deadline " << job.deadline << ", Profit " << job.profit << "\n";
    }
    cout << "\n";
    
    jobSequencing(jobs);
    
    cout << "\n=== Greedy Strategy ===\n";
    cout << "1. Sort jobs by profit (descending)\n";
    cout << "2. For each job:\n";
    cout << "   - Find latest available slot before deadline\n";
    cout << "   - If slot found: schedule job there\n";
    cout << "3. Calculate total profit\n\n";
    
    cout << "=== Complexity ===\n";
    cout << "Time Complexity:  O(n²) worst case\n";
    cout << "Space Complexity: O(n)\n";
    cout << "Optimal: Yes (greedy optimal for this problem)\n";
    
    return 0;
}
