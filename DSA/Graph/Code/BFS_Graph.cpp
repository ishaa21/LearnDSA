#include <iostream>
#include <queue>
#include <vector>
#include <cstring>
using namespace std;

class BFSGraph {
private:
    int vertices;
    vector<vector<int>> adjacencyMatrix;
    
public:
    BFSGraph(int v) : vertices(v) {
        adjacencyMatrix.assign(v, vector<int>(v, 0));
    }
    
    void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
    }
    
    void bfs(int start) {
        vector<bool> visited(vertices, false);
        queue<int> q;
        
        visited[start] = true;
        q.push(start);
        
        cout << "BFS Traversal: ";
        while (!q.empty()) {
            int u = q.front();
            q.pop();
            cout << u << " ";
            
            for (int v = 0; v < vertices; v++) {
                if (adjacencyMatrix[u][v] && !visited[v]) {
                    visited[v] = true;
                    q.push(v);
                }
            }
        }
        cout << "\n";
    }
};

int main() {
    cout << "=== BFS in Graph (C++) ===\n\n";
    
    BFSGraph graph(5);
    
    graph.addEdge(0, 1);
    graph.addEdge(0, 4);
    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(1, 4);
    graph.addEdge(2, 3);
    graph.addEdge(3, 4);
    
    cout << "Graph (5 vertices, 7 edges)\n";
    cout << "Edges: 0-1, 0-4, 1-2, 1-3, 1-4, 2-3, 3-4\n\n";
    
    graph.bfs(0);
    
    cout << "\n=== BFS Algorithm ===\n";
    cout << "1. Initialize queue with start vertex\n";
    cout << "2. Mark start vertex as visited\n";
    cout << "3. While queue is not empty:\n";
    cout << "   a. Dequeue and process vertex\n";
    cout << "   b. For all unvisited neighbors:\n";
    cout << "      - Mark as visited\n";
    cout << "      - Enqueue the neighbor\n";
    cout << "4. Continue until queue is empty\n\n";
    
    cout << "=== BFS Complexity ===\n";
    cout << "Time Complexity:  O(V + E)\n";
    cout << "Space Complexity: O(V)\n";
    cout << "Applications: Shortest path, Level-order, Connected components\n";
    
    return 0;
}
