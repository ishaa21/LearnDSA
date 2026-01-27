#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int compare(const void* a, const void* b) {
    return *(int*)b - *(int*)a;
}

void coinChange(int* coins, int n, int amount) {
    qsort(coins, n, sizeof(int), compare);
    
    printf("Coin Change for amount %d:\n", amount);
    int coinsUsed = 0;
    
    for (int i = 0; i < n && amount > 0; i++) {
        while (amount >= coins[i]) {
            printf("Take coin of value %d\n", coins[i]);
            amount -= coins[i];
            coinsUsed++;
        }
    }
    
    printf("\nTotal Coins Used: %d\n", coinsUsed);
    if (amount > 0) {
        printf("Warning: Cannot make exact change (Remaining: %d)\n", amount);
    } else {
        printf("Amount Made: Complete\n");
    }
}

int main() {
    printf("=== Coin Change Problem (C) ===\n\n");
    
    int coins[] = {1, 5, 10, 25};
    int n = 4;
    int amount = 41;
    
    printf("Available Coins: ");
    for (int i = 0; i < n; i++) {
        printf("%d ", coins[i]);
    }
    printf("\nAmount to Make: %d\n\n", amount);
    
    coinChange(coins, n, amount);
    
    printf("\n=== Greedy Strategy ===\n");
    printf("1. Sort coins in descending order\n");
    printf("2. For each coin (largest to smallest):\n");
    printf("   - Use as many as possible\n");
    printf("   - Subtract from amount\n");
    printf("3. Continue until amount becomes 0\n\n");
    
    printf("=== Complexity ===\n");
    printf("Time Complexity:  O(n log n) for sorting + O(amount)\n");
    printf("Space Complexity: O(1)\n");
    printf("Note: Greedy works for standard coin systems\n");
    
    return 0;
}
