# N-Queens Problem using Backtracking in Python
N = 4
board = [[0]*N for _ in range(N)]

def is_safe(row, col):
    for i in range(col):
        if board[row][i]: return False
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i][j]: return False
    for i, j in zip(range(row, N, 1), range(col, -1, -1)):
        if board[i][j]: return False
    return True

def print_board():
    for i in range(N):
        print(' '.join('Q' if board[i][j] else '.' for j in range(N)))
    print()

def solve_nq_util(col):
    if col == N:
        print_board()
        return
    for i in range(N):
        if is_safe(i, col):
            board[i][col] = 1
            solve_nq_util(col+1)
            board[i][col] = 0

print("=== N-Queens Problem (Python) ===\n")
solve_nq_util(0)
print("Time Complexity: O(N!)")
print("Space Complexity: O(N^2)")
