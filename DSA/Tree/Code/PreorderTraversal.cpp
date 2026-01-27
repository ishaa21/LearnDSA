#include <iostream>
#include <stack>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    
    Node(int val) : data(val), left(NULL), right(NULL) {}
};

class PreorderTraversal {
public:
    // Recursive preorder: Root-Left-Right
    static void preorderRecursive(Node* root) {
        if (root == NULL) return;
        
        cout << root->data << " ";
        preorderRecursive(root->left);
        preorderRecursive(root->right);
    }
    
    // Iterative preorder using stack
    static void preorderIterative(Node* root) {
        stack<Node*> st;
        st.push(root);
        
        while (!st.empty()) {
            Node* node = st.top();
            st.pop();
            cout << node->data << " ";
            
            if (node->right != NULL) {
                st.push(node->right);
            }
            if (node->left != NULL) {
                st.push(node->left);
            }
        }
    }
};

int main() {
    cout << "=== Preorder Traversal (C++) ===\n\n";
    
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
    
    cout << "Recursive Preorder (Root-Left-Right): ";
    PreorderTraversal::preorderRecursive(root);
    cout << "\n";
    
    cout << "Iterative Preorder (using stack):     ";
    PreorderTraversal::preorderIterative(root);
    cout << "\n\n";
    
    cout << "=== Preorder Characteristics ===\n";
    cout << "1. Root → Left subtree → Right subtree\n";
    cout << "2. Root is processed first\n";
    cout << "3. Useful for creating copy of tree\n";
    cout << "4. Useful for prefix expression evaluation\n\n";
    
    cout << "=== Complexity Analysis ===\n";
    cout << "Time Complexity:  O(n) - visit each node once\n";
    cout << "Space Complexity: O(h) - h = height (recursion/stack)\n";
    cout << "                   O(n) worst case (skewed tree)\n";
    
    return 0;
}
