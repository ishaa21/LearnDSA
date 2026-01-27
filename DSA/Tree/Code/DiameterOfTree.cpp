#include <iostream>
#include <algorithm>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    
    Node(int val) : data(val), left(NULL), right(NULL) {}
};

class DiameterOfTree {
private:
    static int getHeight(Node* root) {
        if (root == NULL) {
            return 0;
        }
        
        return max(getHeight(root->left), getHeight(root->right)) + 1;
    }
    
public:
    // Naive approach: O(n²)
    static int getDiameterNaive(Node* root) {
        if (root == NULL) {
            return 0;
        }
        
        int leftHeight = getHeight(root->left);
        int rightHeight = getHeight(root->right);
        int diameterThroughRoot = leftHeight + rightHeight + 1;
        
        int leftDiameter = getDiameterNaive(root->left);
        int rightDiameter = getDiameterNaive(root->right);
        
        return max({diameterThroughRoot, leftDiameter, rightDiameter});
    }
    
    // Optimized approach: O(n)
    static int getDiameterOptimized(Node* root, int& diameter) {
        if (root == NULL) {
            return 0;
        }
        
        int leftHeight = getDiameterOptimized(root->left, diameter);
        int rightHeight = getDiameterOptimized(root->right, diameter);
        
        diameter = max(diameter, leftHeight + rightHeight + 1);
        
        return max(leftHeight, rightHeight) + 1;
    }
};

int main() {
    cout << "=== Diameter of Tree (C++) ===\n\n";
    
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
    
    cout << "Diameter (Naive approach): " << DiameterOfTree::getDiameterNaive(root) << "\n";
    
    int diameter = 0;
    DiameterOfTree::getDiameterOptimized(root, diameter);
    cout << "Diameter (Optimized approach): " << diameter << "\n\n";
    
    cout << "=== Diameter Definition ===\n";
    cout << "Diameter: Longest path between any two nodes in tree\n";
    cout << "Includes: Number of edges in the path\n\n";
    
    cout << "Possible cases for diameter:\n";
    cout << "1. Path passes through root\n";
    cout << "   diameter = leftHeight + rightHeight + 1\n";
    cout << "2. Path entirely in left subtree\n";
    cout << "3. Path entirely in right subtree\n\n";
    
    cout << "=== Complexity Analysis ===\n";
    cout << "Naive Approach:\n";
    cout << "  Time Complexity:  O(n²) - getHeight called for each node\n";
    cout << "  Space Complexity: O(h) - recursion stack\n\n";
    
    cout << "Optimized Approach:\n";
    cout << "  Time Complexity:  O(n) - single pass\n";
    cout << "  Space Complexity: O(h) - recursion stack\n";
    
    return 0;
}
