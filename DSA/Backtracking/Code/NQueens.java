// N-Queens Problem using Backtracking in Java

public class NQueens {
    static final int N = 4;
    static int[][] board = new int[N][N];

    static boolean isSafe(int row, int col) {
        for (int i = 0; i < col; i++)
            if (board[row][i] == 1) return false;
        for (int i = row, j = col; i >= 0 && j >= 0; i--, j--)
            if (board[i][j] == 1) return false;
        for (int i = row, j = col; i < N && j >= 0; i++, j--)
            if (board[i][j] == 1) return false;
        return true;
    }

    static void printBoard() {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++)
                System.out.print((board[i][j] == 1 ? "Q" : ".") + " ");
            System.out.println();
        }
        System.out.println();
    }

    static void solveNQUtil(int col) {
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

    public static void main(String[] args) {
        System.out.println("=== N-Queens Problem (Java) ===\n");
        solveNQUtil(0);
        System.out.println("Time Complexity: O(N!)");
        System.out.println("Space Complexity: O(N^2)");
    }
}
