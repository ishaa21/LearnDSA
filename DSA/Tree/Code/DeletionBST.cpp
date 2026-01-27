#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    
    Node(int val) : data(val), left(NULL), right(NULL) {}
};

class BST {
public:
    Node* findMin(Node* node) {
        while (node->left != NULL) {
            node = node->left;
        }
        return node;
    }
    
    Node* deleteNode(Node* root, int data) {
        if (root == NULL) {
            return NULL;
        }
        
        if (data < root->data) {
            root->left = deleteNode(root->left, data);
        } else if (data > root->data) {
            root->right = deleteNode(root->right, data);
        } else {
            // Case 1: Leaf node
            if (root->left == NULL && root->right == NULL) {
                delete root;
                return NULL;
            }
            
            // Case 2: One child
            if (root->left == NULL) {
                Node* temp = root->right;
                delete root;
                return temp;
            }
            if (root->right == NULL) {
                Node* temp = root->left;
                delete root;
                return temp;
            }
            
            // Case 3: Two children
            Node* successor = findMin(root->right);
            root->data = successor->data;
            root->right = deleteNode(root->right, successor->data);
        }
        
        return root;
    }
    
    void inorder(Node* node) {
        if (node == NULL) return;
        inorder(node->left);
        cout << node->data << " ";
        inorder(node->right);
    }
};

int main() {
    cout << "=== Deletion in BST (C++) ===\n\n";
    
    BST bst;
    Node* root = new Node(50);
    root->left = new Node(30);
    root->right = new Node(70);
    root->left->left = new Node(20);
    root->left->right = new Node(40);
    root->right->left = new Node(60);
    root->right->right = new Node(80);
    
    cout << "Original Tree (Inorder): ";
    bst.inorder(root);
    cout << "\n\n";
    
    cout << "Delete Leaf (20):\n";
    root = bst.deleteNode(root, 20);
    bst.inorder(root);
    cout << "\n\n";
    
    cout << "Delete Node with One Child (30):\n";
    root = bst.deleteNode(root, 30);
    bst.inorder(root);
    cout << "\n\n";
    
    cout << "Delete Node with Two Children (50):\n";
    root = bst.deleteNode(root, 50);
    bst.inorder(root);
    cout << "\n\n";
    
    cout << "=== Deletion Cases ===\n";
    cout << "Case 1: Leaf Node\n";
    cout << "  - Simply remove the node\n";
    cout << "  - Update parent's pointer to NULL\n\n";
    
    cout << "Case 2: Node with One Child\n";
    cout << "  - Replace node with its child\n";
    cout << "  - Update parent's pointer\n\n";
    
    cout << "Case 3: Node with Two Children\n";
    cout << "  - Find inorder successor (min in right subtree)\n";
    cout << "  - Replace node's data with successor's data\n";
    cout << "  - Delete successor node\n\n";
    
    cout << "=== Deletion Complexity ===\n";
    cout << "Time Complexity:  O(log n) avg, O(n) worst\n";
    cout << "Space Complexity: O(h) for recursion\n";
    
    return 0;
}
