#include <iostream>
#include <vector>
#include <unordered_set>
using namespace std;

class Graph {
private:
    int vertices;
    int edges;
    vector<vector<int>> adjacencyMatrix;
    
public:
    Graph(int v) : vertices(v), edges(0) {
        adjacencyMatrix.assign(v, vector<int>(v, 0));
    }
    
    void addEdge(int u, int v) {
        adjacencyMatrix[u][v] = 1;
        adjacencyMatrix[v][u] = 1;
        edges++;
    }
    
    void printAdjacencyMatrix() {
        cout << "Adjacency Matrix:\n";
        for (int i = 0; i < vertices; i++) {
            for (int j = 0; j < vertices; j++) {
                cout << adjacencyMatrix[i][j] << " ";
            }
            cout << "\n";
        }
    }
    
    void printAdjacencyList() {
        cout << "Adjacency List:\n";
        for (int i = 0; i < vertices; i++) {
            cout << i << " -> ";
            for (int j = 0; j < vertices; j++) {
                if (adjacencyMatrix[i][j]) {
                    cout << j << " ";
                }
            }
            cout << "\n";
        }
    }
    
    int getVertices() { return vertices; }
    int getEdges() { return edges; }
};

int main() {
    cout << "=== Graph Representation (C++) ===\n\n";
    
    Graph graph(5);
    
    graph.addEdge(0, 1);
    graph.addEdge(0, 4);
    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(1, 4);
    graph.addEdge(2, 3);
    graph.addEdge(3, 4);
    
    cout << "Vertices: " << graph.getVertices() << ", Edges: " << graph.getEdges() << "\n\n";
    
    graph.printAdjacencyMatrix();
    cout << "\n";
    graph.printAdjacencyList();
    
    cout << "\n=== Graph Representation Methods ===\n";
    cout << "1. Adjacency Matrix\n";
    cout << "   - 2D array where arr[i][j] = 1 if edge exists\n";
    cout << "   - Space: O(V²)\n";
    cout << "   - Edge lookup: O(1)\n\n";
    
    cout << "2. Adjacency List\n";
    cout << "   - Array of linked lists or vectors\n";
    cout << "   - Space: O(V + E)\n";
    cout << "   - Edge lookup: O(degree)\n\n";
    
    cout << "=== Complexity Comparison ===\n";
    cout << "Operation        | Adjacency Matrix | Adjacency List\n";
    cout << "Space           | O(V²)           | O(V + E)\n";
    cout << "Add Edge        | O(1)            | O(1)\n";
    cout << "Remove Edge     | O(1)            | O(degree)\n";
    cout << "Check Edge      | O(1)            | O(degree)\n";
    cout << "Get Neighbors   | O(V)            | O(degree)\n";
    
    return 0;
}
