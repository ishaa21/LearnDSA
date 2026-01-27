#include <iostream>
using namespace std;

// Unbounded Knapsack (DP)
int unboundedKnapsack(int W, int wt[], int val[], int n) {
    int dp[W+1] = {0};
    for (int w = 0; w <= W; w++) {
        for (int i = 0; i < n; i++) {
            if (wt[i] <= w)
                dp[w] = max(dp[w], dp[w-wt[i]] + val[i]);
        }
    }
    return dp[W];
}

int main() {
    cout << "=== Unbounded Knapsack (C++) ===\n\n";
    int val[] = {10, 40, 50, 70};
    int wt[] = {1, 3, 4, 5};
    int W = 8;
    int n = 4;
    cout << "Max value: " << unboundedKnapsack(W, wt, val, n) << endl;
    cout << "\nTime Complexity: O(nW)\nSpace Complexity: O(W)\n";
    return 0;
}
