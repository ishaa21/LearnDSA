#include <iostream>
#include <cstring>
using namespace std;

// Longest Common Subsequence (LCS) (DP)
int lcs(const char* X, const char* Y, int m, int n, string &lcsStr) {
    int dp[m+1][n+1];

    // Build DP table
    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            if (i == 0 || j == 0)
                dp[i][j] = 0;
            else if (X[i-1] == Y[j-1])
                dp[i][j] = 1 + dp[i-1][j-1];
            else
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
        }
    }

    // Length of LCS
    int length = dp[m][n];

    // Reconstruct LCS string
    int i = m, j = n;
    string result = "";
    while (i > 0 && j > 0) {
        if (X[i-1] == Y[j-1]) {
            result = X[i-1] + result; // prepend character
            i--;
            j--;
        }
        else if (dp[i-1][j] > dp[i][j-1])
            i--;
        else
            j--;
    }

    lcsStr = result;
    return dp[m][n];
}

int main() {
    cout << "=== LCS (C++) ===\n\n";
    const char* X = "AGGTAB";
    const char* Y = "GXTXAYB";
    int m = strlen(X);
    int n = strlen(Y);

    string lcsStr;
    int length = lcs(X, Y, m, n, lcsStr);

    cout << "Length of LCS: " << length << endl;
    cout << "LCS: " << lcsStr << endl;

    cout << "\nTime Complexity: O(mn)\nSpace Complexity: O(mn)\n";
    return 0;
}