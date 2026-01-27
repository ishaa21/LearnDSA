#include <iostream>
#include <stack>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    
    Node(int val) : data(val), left(NULL), right(NULL) {}
};

class InorderTraversal {
public:
    // Recursive inorder: Left-Root-Right
    static void inorderRecursive(Node* root) {
        if (root == NULL) return;
        
        inorderRecursive(root->left);
        cout << root->data << " ";
        inorderRecursive(root->right);
    }
    
    // Iterative inorder using stack
    static void inorderIterative(Node* root) {
        stack<Node*> st;
        Node* current = root;
        
        while (current != NULL || !st.empty()) {
            while (current != NULL) {
                st.push(current);
                current = current->left;
            }
            
            current = st.top();
            st.pop();
            cout << current->data << " ";
            current = current->right;
        }
    }
};

int main() {
    cout << "=== Inorder Traversal (C++) ===\n\n";
    
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
    
    cout << "Recursive Inorder (Left-Root-Right): ";
    InorderTraversal::inorderRecursive(root);
    cout << "\n";
    
    cout << "Iterative Inorder (using stack):     ";
    InorderTraversal::inorderIterative(root);
    cout << "\n\n";
    
    cout << "=== Inorder Characteristics ===\n";
    cout << "1. Left subtree → Root → Right subtree\n";
    cout << "2. For BST: Produces sorted sequence\n";
    cout << "3. Recursive approach: Clean and simple\n";
    cout << "4. Iterative approach: Explicit stack management\n\n";
    
    cout << "=== Complexity Analysis ===\n";
    cout << "Time Complexity:  O(n) - visit each node once\n";
    cout << "Space Complexity: O(h) - h = height (recursion/stack)\n";
    cout << "                   O(n) worst case (skewed tree)\n";
    
    return 0;
}
