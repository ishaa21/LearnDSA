#include <iostream>
#include <vector>
using namespace std;

// Longest Increasing Subsequence (LIS) (DP)
int lis(int arr[], int n, vector<int> &sequence) {
    int dp[n];        // dp[i] = length of LIS ending at i
    int parent[n];    // parent[i] = previous index in LIS

    for (int i = 0; i < n; i++) {
        dp[i] = 1;
        parent[i] = -1;
    }

    int res = 1, lastIndex = 0;

    // Build dp and parent arrays
    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (arr[i] > arr[j] && dp[i] < dp[j] + 1) {
                dp[i] = dp[j] + 1;
                parent[i] = j;
            }
        }
        if (dp[i] > res) {
            res = dp[i];
            lastIndex = i;
        }
    }

    // Reconstruct LIS
    vector<int> lisSeq(res);
    int k = res - 1;
    while (lastIndex != -1) {
        lisSeq[k--] = arr[lastIndex];
        lastIndex = parent[lastIndex];
    }

    sequence = lisSeq;
    return res;
}

int main() {
    cout << "=== LIS (C++) ===\n\n";
    int arr[] = {10, 22, 9, 33, 21, 50, 41, 60};
    int n = 8;
    vector<int> sequence;

    int length = lis(arr, n, sequence);

    cout << "Length of LIS: " << length << endl;
    cout << "LIS: ";
    for (int num : sequence) {
        cout << num << " ";
    }
    cout << endl;

    cout << "\nTime Complexity: O(n^2)\nSpace Complexity: O(n)\n";
    return 0;
}