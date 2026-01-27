#include <iostream>
#include <stack>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    
    Node(int val) : data(val), left(NULL), right(NULL) {}
};

class PostorderTraversal {
public:
    // Recursive postorder: Left-Right-Root
    static void postorderRecursive(Node* root) {
        if (root == NULL) return;
        
        postorderRecursive(root->left);
        postorderRecursive(root->right);
        cout << root->data << " ";
    }
    
    // Iterative postorder using two stacks
    static void postorderIterative(Node* root) {
        stack<Node*> st1, st2;
        st1.push(root);
        
        while (!st1.empty()) {
            Node* node = st1.top();
            st1.pop();
            st2.push(node);
            
            if (node->left != NULL) st1.push(node->left);
            if (node->right != NULL) st1.push(node->right);
        }
        
        while (!st2.empty()) {
            cout << st2.top()->data << " ";
            st2.pop();
        }
    }
};

int main() {
    cout << "=== Postorder Traversal (C++) ===\n\n";
    
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
    
    cout << "Recursive Postorder (Left-Right-Root): ";
    PostorderTraversal::postorderRecursive(root);
    cout << "\n";
    
    cout << "Iterative Postorder (two stacks):      ";
    PostorderTraversal::postorderIterative(root);
    cout << "\n\n";
    
    cout << "=== Postorder Characteristics ===\n";
    cout << "1. Left subtree → Right subtree → Root\n";
    cout << "2. Root is processed last\n";
    cout << "3. Useful for deleting tree\n";
    cout << "4. Useful for postfix expression evaluation\n\n";
    
    cout << "=== Complexity Analysis ===\n";
    cout << "Time Complexity:  O(n) - visit each node once\n";
    cout << "Space Complexity: O(h) - h = height (recursion/stack)\n";
    cout << "                   O(n) worst case (skewed tree)\n";
    
    return 0;
}
