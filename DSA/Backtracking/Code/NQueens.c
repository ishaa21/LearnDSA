#include <stdio.h>
#include <math.h>

// N-Queens Problem using Backtracking
#define N 4

int board[N][N];

int isSafe(int row, int col) {
    for (int i = 0; i < col; i++)
        if (board[row][i]) return 0;
    for (int i = row, j = col; i >= 0 && j >= 0; i--, j--)
        if (board[i][j]) return 0;
    for (int i = row, j = col; i < N && j >= 0; i++, j--)
        if (board[i][j]) return 0;
    return 1;
}

void printBoard() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++)
            printf("%c ", board[i][j] ? 'Q' : '.');
        printf("\n");
    }
    printf("\n");
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
    printf("=== N-Queens Problem (C) ===\n\n");
    solveNQUtil(0);
    printf("Time Complexity: O(N!)\nSpace Complexity: O(N^2)\n");
    return 0;
}
