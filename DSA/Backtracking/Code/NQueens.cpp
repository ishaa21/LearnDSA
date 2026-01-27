#include <iostream>
#include <vector>
using namespace std;

// N-Queens Problem using Backtracking
#define N 4

int board[N][N];

bool isSafe(int row, int col) {
    for (int i = 0; i < col; i++)
        if (board[row][i]) return false;
    for (int i = row, j = col; i >= 0 && j >= 0; i--, j--)
        if (board[i][j]) return false;
    for (int i = row, j = col; i < N && j >= 0; i++, j--)
        if (board[i][j]) return false;
    return true;
}

void printBoard() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++)
            cout << (board[i][j] ? 'Q' : '.') << " ";
        cout << endl;
    }
    cout << endl;
}

void solveNQUtil(int col) {
    if (col == N) {
        printBoard();
        return;
    }
    for (int i = 0; i < N; i++) {
        if (isSafe(i, col)) {
            board[i][col] = 1;
            solveNQUtil(col+1);
            board[i][col] = 0;
        }
    }
}

int main() {
    cout << "=== N-Queens Problem (C++) ===\n\n";
    solveNQUtil(0);
    cout << "Time Complexity: O(N!)\nSpace Complexity: O(N^2)\n";
    return 0;
}
