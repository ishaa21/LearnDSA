#include <iostream>
#include <vector>
using namespace std;

// Combinations using Backtracking
void combineUtil(vector<int>& arr, int r, int idx, vector<int>& data, int i) {
    if (idx == r) {
        cout << "[";
        for (int j = 0; j < r; j++) cout << data[j] << (j+1==r?"":", ");
        cout << "]\n";
        return;
    }
    if (i >= arr.size()) return;
    data[idx] = arr[i];
    combineUtil(arr, r, idx+1, data, i+1);
    combineUtil(arr, r, idx, data, i+1);
}

int main() {
    cout << "=== Combinations (C++) ===\n\n";
    vector<int> arr = {1, 2, 3, 4};
    int r = 2;
    vector<int> data(10);
    combineUtil(arr, r, 0, data, 0);
    cout << "\nTime Complexity: O(C(n, r) * r)\nSpace Complexity: O(r)\n";
    return 0;
}
