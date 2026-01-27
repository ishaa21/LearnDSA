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
    Node* insertRecursive(Node* node, int data) {
        if (node == NULL) {
            return new Node(data);
        }
        
        if (data < node->data) {
            node->left = insertRecursive(node->left, data);
        } else if (data > node->data) {
            node->right = insertRecursive(node->right, data);
        }
        
        return node;
    }
    
    Node* insertIterative(Node* root, int data) {
        Node* newNode = new Node(data);
        
        if (root == NULL) {
            return newNode;
        }
        
        Node* current = root;
        Node* parent = NULL;
        
        while (current != NULL) {
            parent = current;
            if (data < current->data) {
                current = current->left;
            } else if (data > current->data) {
                current = current->right;
            } else {
                return root;
            }
        }
        
        if (data < parent->data) {
            parent->left = newNode;
        } else {
            parent->right = newNode;
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
    cout << "=== Insertion in BST (C++) ===\n\n";
    
    BST bst;
    Node* root1 = NULL;
    
    cout << "Recursive Insertion:\n";
    root1 = bst.insertRecursive(root1, 50);
    root1 = bst.insertRecursive(root1, 30);
    root1 = bst.insertRecursive(root1, 70);
    root1 = bst.insertRecursive(root1, 20);
    root1 = bst.insertRecursive(root1, 40);
    root1 = bst.insertRecursive(root1, 60);
    root1 = bst.insertRecursive(root1, 80);
    cout << "Inorder: ";
    bst.inorder(root1);
    cout << "\n\n";
    
    Node* root2 = NULL;
    cout << "Iterative Insertion:\n";
    root2 = bst.insertIterative(root2, 50);
    root2 = bst.insertIterative(root2, 30);
    root2 = bst.insertIterative(root2, 70);
    root2 = bst.insertIterative(root2, 20);
    root2 = bst.insertIterative(root2, 40);
    root2 = bst.insertIterative(root2, 60);
    root2 = bst.insertIterative(root2, 80);
    cout << "Inorder: ";
    bst.inorder(root2);
    cout << "\n\n";
    
    cout << "=== Insertion Steps ===\n";
    cout << "1. Start at root\n";
    cout << "2. If data < current, go left\n";
    cout << "3. If data > current, go right\n";
    cout << "4. If NULL found, insert new node\n";
    cout << "5. If duplicate, don't insert\n\n";
    
    cout << "=== Insertion Complexity ===\n";
    cout << "Time Complexity:  O(log n) avg, O(n) worst\n";
    cout << "Space Complexity: O(h) for recursion\n";
    cout << "                  O(1) for iteration\n";
    
    return 0;
}
