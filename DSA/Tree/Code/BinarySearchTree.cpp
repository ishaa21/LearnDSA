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
    Node* root;
    
    BST() : root(NULL) {}
    
    Node* insert(Node* node, int data) {
        if (node == NULL) {
            return new Node(data);
        }
        
        if (data < node->data) {
            node->left = insert(node->left, data);
        } else if (data > node->data) {
            node->right = insert(node->right, data);
        }
        
        return node;
    }
    
    Node* search(Node* node, int data) {
        if (node == NULL) {
            return NULL;
        }
        
        if (data == node->data) {
            return node;
        } else if (data < node->data) {
            return search(node->left, data);
        } else {
            return search(node->right, data);
        }
    }
    
    void inorder(Node* node) {
        if (node == NULL) return;
        
        inorder(node->left);
        cout << node->data << " ";
        inorder(node->right);
    }
    
    void insertValue(int data) {
        root = insert(root, data);
    }
    
    bool searchValue(int data) {
        return search(root, data) != NULL;
    }
    
    void printInorder() {
        inorder(root);
    }
};

int main() {
    cout << "=== Binary Search Tree (C++) ===\n\n";
    
    BST bst;
    
    cout << "Inserting: 50, 30, 70, 20, 40, 60, 80\n";
    bst.insertValue(50);
    bst.insertValue(30);
    bst.insertValue(70);
    bst.insertValue(20);
    bst.insertValue(40);
    bst.insertValue(60);
    bst.insertValue(80);
    
    cout << "Inorder Traversal (Sorted): ";
    bst.printInorder();
    cout << "\n\n";
    
    cout << "Searching for 40: " << (bst.searchValue(40) ? "Found" : "Not Found") << "\n";
    cout << "Searching for 25: " << (bst.searchValue(25) ? "Found" : "Not Found") << "\n\n";
    
    cout << "=== BST Properties ===\n";
    cout << "1. Left subtree < Root < Right subtree\n";
    cout << "2. All nodes in left subtree < root\n";
    cout << "3. All nodes in right subtree > root\n";
    cout << "4. Inorder traversal gives sorted sequence\n";
    cout << "5. No duplicate values\n\n";
    
    cout << "=== BST Structure ===\n";
    cout << "        50\n";
    cout << "       /  \\\n";
    cout << "      30   70\n";
    cout << "     / \\  / \\\n";
    cout << "    20 40 60 80\n\n";
    
    cout << "=== Operations Complexity ===\n";
    cout << "Average Case (Balanced):\n";
    cout << "  Search:   O(log n)\n";
    cout << "  Insert:   O(log n)\n";
    cout << "  Delete:   O(log n)\n\n";
    
    cout << "Worst Case (Skewed):\n";
    cout << "  Search:   O(n)\n";
    cout << "  Insert:   O(n)\n";
    cout << "  Delete:   O(n)\n";
    
    return 0;
}
