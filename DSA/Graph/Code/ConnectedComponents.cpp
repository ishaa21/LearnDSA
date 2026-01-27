#include <iostream>
#include <queue>
#include <vector>
using namespace std;

class ConnectedComponents {
private:
    int vertices;
    vector<vector<int>> adjacencyMatrix;
    
public:
    ConnectedComponents(int v) : vertices(v) {
        adjacencyMatrix.assign(v, vector<int>(v, 0));
    }
    
    void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
    }
    
    void findComponents() {
        vector<bool> visited(vertices, false);
        int component = 0;
        
        cout << "Connected Components:\n";
        for (int i = 0; i < vertices; i++) {
            if (!visited[i]) {
                cout << "Component " << ++component << ": ";
                
                queue<int> q;
                q.push(i);
                visited[i] = true;
                
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
        }
    }
};

int main() {
    cout << "=== Connected Components (C++) ===\n\n";
    
    ConnectedComponents graph(6);
    
    graph.addEdge(0, 1);
    graph.addEdge(0, 2);
    graph.addEdge(3, 4);
    
    cout << "Graph (6 vertices):\n";
    cout << "Component 1: 0-1, 0-2\n";
    cout << "Component 2: 3-4\n";
    cout << "Isolated: 5\n\n";
    
    graph.findComponents();
    
    cout << "\n=== Algorithm ===\n";
    cout << "1. Initialize all vertices as unvisited\n";
    cout << "2. For each unvisited vertex:\n";
    cout << "   a. Start BFS/DFS from that vertex\n";
    cout << "   b. Mark all reachable vertices as visited\n";
    cout << "   c. This forms one connected component\n";
    cout << "3. Repeat until all vertices visited\n\n";
    
    cout << "=== Complexity ===\n";
    cout << "Time Complexity:  O(V + E)\n";
    cout << "Space Complexity: O(V)\n";
    
    return 0;
}
