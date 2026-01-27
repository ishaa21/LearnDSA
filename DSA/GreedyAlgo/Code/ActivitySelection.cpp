#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Activity {
    int id, start, end;
    bool operator<(const Activity& other) const {
        return end < other.end;
    }
};

void activitySelection(vector<Activity>& activities) {
    sort(activities.begin(), activities.end());
    
    cout << "Selected Activities:\n";
    cout << "Activity " << activities[0].id << " (" << activities[0].start << " - " << activities[0].end << ")\n";
    
    int lastEnd = activities[0].end;
    int count = 1;
    
    for (int i = 1; i < activities.size(); i++) {
        if (activities[i].start >= lastEnd) {
            cout << "Activity " << activities[i].id << " (" << activities[i].start << " - " << activities[i].end << ")\n";
            lastEnd = activities[i].end;
            count++;
        }
    }
    
    cout << "\nTotal Activities Selected: " << count << "\n";
}

int main() {
    cout << "=== Activity Selection Problem (C++) ===\n\n";
    
    vector<Activity> activities = {
        {1, 0, 5},
        {2, 1, 2},
        {3, 3, 4},
        {4, 0, 6},
        {5, 5, 7},
        {6, 8, 9}
    };
    
    cout << "Activities (ID, Start, End):\n";
    for (const auto& a : activities) {
        cout << "Activity " << a.id << ": " << a.start << " - " << a.end << "\n";
    }
    cout << "\n";
    
    activitySelection(activities);
    
    cout << "\n=== Greedy Strategy ===\n";
    cout << "1. Sort activities by end time\n";
    cout << "2. Select first activity\n";
    cout << "3. For remaining activities:\n";
    cout << "   - If start >= last end: select it\n";
    cout << "4. Repeat until all checked\n\n";
    
    cout << "=== Complexity ===\n";
    cout << "Time Complexity:  O(n log n) for sorting\n";
    cout << "Space Complexity: O(1)\n";
    cout << "Greedy Choice: Earliest finish time\n";
    
    return 0;
}
