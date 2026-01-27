#include <stdio.h>
#include <string.h>

// Utility function to get max of two numbers
int max(int a, int b) { return a > b ? a : b; }

// Function to compute LCS length and subsequence
int lcs(char* X, char* Y, int m, int n) {
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

    // Reconstruct LCS string from dp table
    char lcsStr[length+1];
    lcsStr[length] = '\0';  // Null terminate

    int i = m, j = n;
    while (i > 0 && j > 0) {
        if (X[i-1] == Y[j-1]) {
            lcsStr[length-1] = X[i-1]; // Put current char in result
            i--;
            j--;
            length--;
        }
        else if (dp[i-1][j] > dp[i][j-1])
            i--;
        else
            j--;
    }

    printf("Length of LCS: %d\n", dp[m][n]);
    printf("LCS: %s\n", lcsStr);

    return dp[m][n];
}

int main() {
    printf("=== LCS (C) ===\n\n");
    char X[] = "AGGTAB";
    char Y[] = "GXTXAYB";
    int m = strlen(X);
    int n = strlen(Y);

    lcs(X, Y, m, n);

    printf("\nTime Complexity: O(mn)\nSpace Complexity: O(mn)\n");
    return 0;
}