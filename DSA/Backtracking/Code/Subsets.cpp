#include <iostream>
#include <vector>
using namespace std;

// Subsets using Backtracking
void printSubset(vector<int>& arr, int idx, vector<int>& subset) {
    if (idx == arr.size()) {
        cout << "[";
        for (int i = 0; i < subset.size(); i++) cout << subset[i] << (i+1==subset.size()?"":", ");
        cout << "]\n";
        return;
    }
    // Include arr[idx]
    subset.push_back(arr[idx]);
    printSubset(arr, idx+1, subset);
    subset.pop_back();
    // Exclude arr[idx]
    printSubset(arr, idx+1, subset);
}

int main() {
    cout << "=== Subsets (C++) ===\n\n";
    vector<int> arr = {1, 2, 3};
    vector<int> subset;
    printSubset(arr, 0, subset);
    cout << "\nTime Complexity: O(2^n * n)\nSpace Complexity: O(n)\n";
    return 0;
}
