#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Item {
    int id;
    double weight;
    double value;
    double ratio;
    
    bool operator<(const Item& other) const {
        return ratio > other.ratio;
    }
};

void fractionalKnapsack(vector<Item>& items, double capacity) {
    for (auto& item : items) {
        item.ratio = item.value / item.weight;
    }
    
    sort(items.begin(), items.end());
    
    cout << "Fractional Knapsack Solution:\n";
    double totalValue = 0;
    double usedCapacity = 0;
    
    for (auto& item : items) {
        if (usedCapacity >= capacity) break;
        
        double take = min(capacity - usedCapacity, item.weight);
        cout << "Item " << item.id << ": Take " << take << " units (Weight: " << item.weight 
             << ", Value/Weight: " << item.ratio << ")\n";
        
        totalValue += take * item.ratio;
        usedCapacity += take;
    }
    
    cout << "\nTotal Capacity Used: " << usedCapacity << " / " << capacity << "\n";
    cout << "Total Value: " << totalValue << "\n";
}

int main() {
    cout << "=== Fractional Knapsack (C++) ===\n\n";
    
    vector<Item> items = {
        {1, 10, 60, 0},
        {2, 20, 100, 0},
        {3, 30, 120, 0}
    };
    double capacity = 50;
    
    cout << "Items (ID, Weight, Value):\n";
    for (const auto& item : items) {
        cout << "Item " << item.id << ": Weight " << item.weight << ", Value " << item.value << "\n";
    }
    cout << "Knapsack Capacity: " << capacity << "\n\n";
    
    fractionalKnapsack(items, capacity);
    
    cout << "\n=== Greedy Strategy ===\n";
    cout << "1. Calculate value/weight ratio for each item\n";
    cout << "2. Sort items by ratio (descending)\n";
    cout << "3. For each item in sorted order:\n";
    cout << "   - If item fits completely: take it\n";
    cout << "   - Otherwise: take fraction that fits\n";
    cout << "4. Repeat until capacity full\n\n";
    
    cout << "=== Complexity ===\n";
    cout << "Time Complexity:  O(n log n) for sorting\n";
    cout << "Space Complexity: O(1)\n";
    cout << "Optimal: Yes (greedy works for fractional)\n";
    
    return 0;
}
