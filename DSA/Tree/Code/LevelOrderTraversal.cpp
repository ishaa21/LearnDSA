#include <iostream>
#include <queue>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    
    Node(int val) : data(val), left(NULL), right(NULL) {}
};

class LevelOrderTraversal {
public:
    // Level Order Traversal (BFS)
    static void levelOrder(Node* root) {
        queue<Node*> q;
        q.push(root);
        
        while (!q.empty()) {
            Node* node = q.front();
            q.pop();
            cout << node->data << " ";
            
            if (node->left != NULL) {
                q.push(node->left);
            }
            if (node->right != NULL) {
                q.push(node->right);
            }
        }
    }
};

int main() {
    cout << "=== Level Order Traversal (C++) ===\n\n";
    
    // Create tree
    Node* root = new Node(1);
    root->left = new Node(2);
    root->right = new Node(3);
    root->left->left = new Node(4);
    root->left->right = new Node(5);
    root->right->left = new Node(6);
    root->right->right = new Node(7);
    
    cout << "Tree structure:\n";
    cout << "         1\n";
    cout << "        / \\\n";
    cout << "       2   3\n";
    cout << "      / \\ / \\\n";
    cout << "     4  5 6  7\n\n";
    
    cout << "Level Order Traversal (BFS): ";
    LevelOrderTraversal::levelOrder(root);
    cout << "\n\n";
    
    cout << "=== Level Order Characteristics ===\n";
    cout << "1. Visit all nodes at level k before level k+1\n";
    cout << "2. Also called Breadth-First Search (BFS)\n";
    cout << "3. Uses queue data structure\n";
    cout << "4. Useful for finding shortest path in trees\n\n";
    
    cout << "=== Complexity Analysis ===\n";
    cout << "Time Complexity:  O(n) - visit each node once\n";
    cout << "Space Complexity: O(w) - w = maximum width (max nodes at any level)\n";
    cout << "                   O(n) in worst case\n";
    
    return 0;
}
