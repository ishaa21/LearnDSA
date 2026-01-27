// N-Queens Problem using Backtracking in C#

using System;

class NQueens {
    const int N = 4;
    static int[,] board = new int[N, N];

    static bool IsSafe(int row, int col) {
        for (int i = 0; i < col; i++)
            if (board[row, i] == 1) return false;
        for (int i = row, j = col; i >= 0 && j >= 0; i--, j--)
            if (board[i, j] == 1) return false;
        for (int i = row, j = col; i < N && j >= 0; i++, j--)
            if (board[i, j] == 1) return false;
        return true;
    }

    static void PrintBoard() {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++)
                Console.Write((board[i, j] == 1 ? "Q" : ".") + " ");
            Console.WriteLine();
        }
        Console.WriteLine();
    }

    static void SolveNQUtil(int col) {
        if (col == N) {
            PrintBoard();
            return;
        }
        for (int i = 0; i < N; i++) {
            if (IsSafe(i, col)) {
                board[i, col] = 1;
                SolveNQUtil(col+1);
                board[i, col] = 0;
            }
        }
    }

    static void Main() {
        Console.WriteLine("=== N-Queens Problem (C#) ===\n");
        SolveNQUtil(0);
        Console.WriteLine("Time Complexity: O(N!)");
        Console.WriteLine("Space Complexity: O(N^2)");
    }
}
