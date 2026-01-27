#include <iostream>
#include <queue>
using namespace std;

// Binary Tree Node
struct Node {
    int data;
    Node* left;
    Node* right;
    
    Node(int val) : data(val), left(NULL), right(NULL) {}
};

class BinaryTree {
private:
    Node* root;
    
    Node* insertHelper(Node* node, int data) {
        if (node == NULL) {
            return new Node(data);
        }
        
        queue<Node*> q;
        q.push(node);
        
        while (!q.empty()) {
            Node* temp = q.front();
            q.pop();
            
            if (temp->left == NULL) {
                temp->left = new Node(data);
                break;
            } else {
                q.push(temp->left);
            }
            
            if (temp->right == NULL) {
                temp->right = new Node(data);
                break;
            } else {
                q.push(temp->right);
            }
        }
        
        return node;
    }
    
    void inorderHelper(Node* node) {
        if (node == NULL) return;
        
        inorderHelper(node->left);
        cout << node->data << " ";
        inorderHelper(node->right);
    }
    
    void preorderHelper(Node* node) {
        if (node == NULL) return;
        
        cout << node->data << " ";
        preorderHelper(node->left);
        preorderHelper(node->right);
    }
    
    void postorderHelper(Node* node) {
        if (node == NULL) return;
        
        postorderHelper(node->left);
        postorderHelper(node->right);
        cout << node->data << " ";
    }
    
    Node* searchHelper(Node* node, int data) {
        if (node == NULL) return NULL;
        
        if (node->data == data) return node;
        
        Node* left = searchHelper(node->left, data);
        if (left != NULL) return left;
        
        return searchHelper(node->right, data);
    }
    
public:
    BinaryTree() : root(NULL) {}
    
    void insert(int data) {
        root = insertHelper(root, data);
    }
    
    void inorder() {
        inorderHelper(root);
    }
    
    void preorder() {
        preorderHelper(root);
    }
    
    void postorder() {
        postorderHelper(root);
    }
    
    bool search(int data) {
        return searchHelper(root, data) != NULL;
    }
};

int main() {
    cout << "=== Binary Tree (C++) ===\n\n";
    
    BinaryTree bt;
    
    cout << "Inserting elements: 1, 2, 3, 4, 5, 6, 7\n";
    bt.insert(1);
    bt.insert(2);
    bt.insert(3);
    bt.insert(4);
    bt.insert(5);
    bt.insert(6);
    bt.insert(7);
    
    cout << "\nInorder Traversal (Left-Root-Right): ";
    bt.inorder();
    cout << "\n";
    
    cout << "Preorder Traversal (Root-Left-Right): ";
    bt.preorder();
    cout << "\n";
    
    cout << "Postorder Traversal (Left-Right-Root): ";
    bt.postorder();
    cout << "\n\n";
    
    cout << "Searching for 5: " << (bt.search(5) ? "Found" : "Not Found") << "\n";
    cout << "Searching for 10: " << (bt.search(10) ? "Found" : "Not Found") << "\n\n";
    
    cout << "=== Binary Tree Structure ===\n";
    cout << "Tree structure:\n";
    cout << "         1\n";
    cout << "        / \\\n";
    cout << "       2   3\n";
    cout << "      / \\ / \\\n";
    cout << "     4  5 6  7\n\n";
    
    cout << "=== Operations Complexity ===\n";
    cout << "Insert:     O(n) in worst case\n";
    cout << "Search:     O(n) in worst case\n";
    cout << "Traversal:  O(n) for all traversals\n";
    cout << "Space:      O(h) where h = height (recursion stack)\n";
    
    return 0;
}
