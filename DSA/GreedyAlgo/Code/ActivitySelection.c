#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Activity {
    int id;
    int start;
    int end;
} Activity;

int compare(const void* a, const void* b) {
    return ((Activity*)a)->end - ((Activity*)b)->end;
}

void activitySelection(Activity* activities, int n) {
    qsort(activities, n, sizeof(Activity), compare);
    
    printf("Selected Activities:\n");
    printf("Activity %d (%d - %d)\n", activities[0].id, activities[0].start, activities[0].end);
    
    int lastEnd = activities[0].end;
    int count = 1;
    
    for (int i = 1; i < n; i++) {
        if (activities[i].start >= lastEnd) {
            printf("Activity %d (%d - %d)\n", activities[i].id, activities[i].start, activities[i].end);
            lastEnd = activities[i].end;
            count++;
        }
    }
    
    printf("\nTotal Activities Selected: %d\n", count);
}

int main() {
    printf("=== Activity Selection Problem (C) ===\n\n");
    
    Activity activities[] = {
        {1, 0, 5},
        {2, 1, 2},
        {3, 3, 4},
        {4, 0, 6},
        {5, 5, 7},
        {6, 8, 9}
    };
    int n = 6;
    
    printf("Activities (ID, Start, End):\n");
    for (int i = 0; i < n; i++) {
        printf("Activity %d: %d - %d\n", activities[i].id, activities[i].start, activities[i].end);
    }
    printf("\n");
    
    activitySelection(activities, n);
    
    printf("\n=== Greedy Strategy ===\n");
    printf("1. Sort activities by end time\n");
    printf("2. Select first activity\n");
    printf("3. For remaining activities:\n");
    printf("   - If start >= last end: select it\n");
    printf("4. Repeat until all checked\n\n");
    
    printf("=== Complexity ===\n");
    printf("Time Complexity:  O(n log n) for sorting\n");
    printf("Space Complexity: O(1)\n");
    printf("Greedy Choice: Earliest finish time\n");
    
    return 0;
}
