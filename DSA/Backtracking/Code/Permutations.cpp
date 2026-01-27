#include <iostream>
#include <vector>
using namespace std;

// Permutations using Backtracking
void permute(vector<int>& arr, int l, int r) {
    if (l == r) {
        cout << "[";
        for (int i = 0; i <= r; i++) cout << arr[i] << (i==r?"":", ");
        cout << "]\n";
        return;
    }
    for (int i = l; i <= r; i++) {
        swap(arr[l], arr[i]);
        permute(arr, l+1, r);
        swap(arr[l], arr[i]);
    }
}

int main() {
    cout << "=== Permutations (C++) ===\n\n";
    vector<int> arr = {1, 2, 3};
    permute(arr, 0, arr.size()-1);
    cout << "\nTime Complexity: O(n! * n)\nSpace Complexity: O(n)\n";
    return 0;
}
