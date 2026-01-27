#include <stdio.h>
#include <stdlib.h>

typedef struct Item {
    int id;
    double weight;
    double value;
    double ratio;
} Item;

int compare(const void* a, const void* b) {
    return ((Item*)b)->ratio > ((Item*)a)->ratio ? 1 : -1;
}

void fractionalKnapsack(Item* items, int n, double capacity) {
    for (int i = 0; i < n; i++) {
        items[i].ratio = items[i].value / items[i].weight;
    }
    
    qsort(items, n, sizeof(Item), compare);
    
    printf("Fractional Knapsack Solution:\n");
    double totalValue = 0;
    double usedCapacity = 0;
    
    for (int i = 0; i < n && usedCapacity < capacity; i++) {
        double take = (capacity - usedCapacity) < items[i].weight ? 
                      (capacity - usedCapacity) : items[i].weight;
        
        printf("Item %d: Take %.2f units (Weight: %.2f, Value/Weight: %.2f)\n", 
               items[i].id, take, items[i].weight, items[i].ratio);
        
        totalValue += take * items[i].ratio;
        usedCapacity += take;
    }
    
    printf("\nTotal Capacity Used: %.2f / %.2f\n", usedCapacity, capacity);
    printf("Total Value: %.2f\n", totalValue);
}

int main() {
    printf("=== Fractional Knapsack (C) ===\n\n");
    
    Item items[] = {
        {1, 10, 60},
        {2, 20, 100},
        {3, 30, 120}
    };
    int n = 3;
    double capacity = 50;
    
    printf("Items (ID, Weight, Value):\n");
    for (int i = 0; i < n; i++) {
        printf("Item %d: Weight %.2f, Value %.2f\n", items[i].id, items[i].weight, items[i].value);
    }
    printf("Knapsack Capacity: %.2f\n\n", capacity);
    
    fractionalKnapsack(items, n, capacity);
    
    printf("\n=== Greedy Strategy ===\n");
    printf("1. Calculate value/weight ratio for each item\n");
    printf("2. Sort items by ratio (descending)\n");
    printf("3. For each item in sorted order:\n");
    printf("   - If item fits completely: take it\n");
    printf("   - Otherwise: take fraction that fits\n");
    printf("4. Repeat until capacity full\n\n");
    
    printf("=== Complexity ===\n");
    printf("Time Complexity:  O(n log n) for sorting\n");
    printf("Space Complexity: O(1)\n");
    printf("Optimal: Yes (greedy works for fractional)\n");
    
    return 0;
}
