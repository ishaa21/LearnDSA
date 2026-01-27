#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

void coinChange(vector<int>& coins, int amount) {
    sort(coins.rbegin(), coins.rend());
    
    cout << "Coin Change for amount " << amount << ":\n";
    int coinsUsed = 0;
    
    for (int coin : coins) {
        while (amount >= coin) {
            cout << "Take coin of value " << coin << "\n";
            amount -= coin;
            coinsUsed++;
        }
    }
    
    cout << "\nTotal Coins Used: " << coinsUsed << "\n";
    if (amount > 0) {
        cout << "Warning: Cannot make exact change (Remaining: " << amount << ")\n";
    } else {
        cout << "Amount Made: Complete\n";
    }
}

int main() {
    cout << "=== Coin Change Problem (C++) ===\n\n";
    
    vector<int> coins = {1, 5, 10, 25};
    int amount = 41;
    
    cout << "Available Coins: ";
    for (int coin : coins) {
        cout << coin << " ";
    }
    cout << "\nAmount to Make: " << amount << "\n\n";
    
    coinChange(coins, amount);
    
    cout << "\n=== Greedy Strategy ===\n";
    cout << "1. Sort coins in descending order\n";
    cout << "2. For each coin (largest to smallest):\n";
    cout << "   - Use as many as possible\n";
    cout << "   - Subtract from amount\n";
    cout << "3. Continue until amount becomes 0\n\n";
    
    cout << "=== Complexity ===\n";
    cout << "Time Complexity:  O(n log n) for sorting + O(amount)\n";
    cout << "Space Complexity: O(1)\n";
    cout << "Note: Greedy works for standard coin systems\n";
    
    return 0;
}
