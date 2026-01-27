#include <iostream>
#include <algorithm>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    
    Node(int val) : data(val), left(NULL), right(NULL) {}
};

class TreeHeight {
public:
    // Calculate height of tree
    static int getHeight(Node* root) {
        if (root == NULL) {
            return 0;
        }
        
        int leftHeight = getHeight(root->left);
        int rightHeight = getHeight(root->right);
        
        return max(leftHeight, rightHeight) + 1;
    }
    
    // Calculate depth (distance from root)
    static int getDepth(Node* root, Node* target, int depth = 0) {
        if (root == NULL) {
            return -1;
        }
        
        if (root == target) {
            return depth;
        }
        
        int leftDepth = getDepth(root->left, target, depth + 1);
        if (leftDepth != -1) return leftDepth;
        
        return getDepth(root->right, target, depth + 1);
    }
    
    // Count total nodes
    static int countNodes(Node* root) {
        if (root == NULL) {
            return 0;
        }
        return 1 + countNodes(root->left) + countNodes(root->right);
    }
};

int main() {
    cout << "=== Height of Tree (C++) ===\n\n";
    
    // Create tree
    Node* root = new Node(1);
    root->left = new Node(2);
    root->right = new Node(3);
    root->left->left = new Node(4);
    root->left->right = new Node(5);
    root->right->right = new Node(6);
    root->right->right->right = new Node(7);
    
    cout << "Tree structure:\n";
    cout << "         1\n";
    cout << "        / \\\n";
    cout << "       2   3\n";
    cout << "      / \\   \\\n";
    cout << "     4   5   6\n";
    cout << "           \\\n";
    cout << "            7\n\n";
    
    cout << "Height of tree: " << TreeHeight::getHeight(root) << "\n";
    cout << "Number of nodes: " << TreeHeight::countNodes(root) << "\n\n";
    
    cout << "=== Height Analysis ===\n";
    cout << "Minimum height of balanced tree with n nodes:\n";
    cout << "  h_min = ceil(log₂(n+1)) - 1\n";
    cout << "  h_min = ceil(log₂(7+1)) - 1 = 2\n\n";
    
    cout << "Maximum height of skewed tree:\n";
    cout << "  h_max = n - 1 (for n nodes)\n\n";
    
    cout << "=== Height Definition ===\n";
    cout << "Height of node: Distance from node to farthest leaf\n";
    cout << "Height of tree: Height of root node\n";
    cout << "Height of NULL: 0\n";
    cout << "Height of leaf: 1\n\n";
    
    cout << "=== Complexity Analysis ===\n";
    cout << "Time Complexity:  O(n) - visit each node once\n";
    cout << "Space Complexity: O(h) - h = height (recursion stack)\n";
    
    return 0;
}
