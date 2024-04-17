#pragma once
#include <queue>
#include <stack>
#include <iostream>


class BinarySearchTree
{
private:
    struct Node
    {
        int data;
        Node* parent;
        Node* left;
        Node* right;
        Node(int value)
        {
            data = value;
            parent = nullptr;
            left = nullptr;
            right = nullptr;
        }
    };

    Node* root;

    Node* addNode(Node* node, int value) 
    {
        if (node == nullptr) {
            return new Node(value);
        }

        if (value < node->data) {
            node->left = addNode(node->left, value);
        }
        else if (value > node->data) {
            node->right = addNode(node->right, value);
        }

        return node;
    }

    Node* findMinNode(Node* node) 
    {
        while (node->left != nullptr) 
        {
            node = node->left;
        }
        return node;
    }

    Node* findMaxNode(Node* node) 
    {
        while (node->right != nullptr) 
        {
            node = node->right;
        }
        return node;
    }

    Node* search(Node* node, int value) 
    {
        if (node == nullptr || node->data == value) 
        {
            return node;
        }
        if (value < node->data) 
        {
            return search(node->left, value);
        }
        else 
        {
            return search(node->right, value);
        }
    }

    Node* findSuccessor(Node* node) {
        if (node->right != nullptr) {
            return findMinNode(node->right);
        }
        return nullptr;
    }

    Node* deleteNode(Node* node, int value) 
    {
        if (node == nullptr) {
            return node;
        }

        if (value < node->data) {
            node->left = deleteNode(node->left, value);
        }
        else if (value > node->data) {
            node->right = deleteNode(node->right, value);
        }
        else {
            if (node->left == nullptr) {
                Node* temp = node->right;
                delete node;
                return temp;
            }
            else if (node->right == nullptr) {
                Node* temp = node->left;
                delete node;
                return temp;
            }

            Node* temp = findMinNode(node->right);
            node->data = temp->data;
            node->right = deleteNode(node->right, temp->data);
        }
        return node;
    }

    bool compareTrees(Node* node1, Node* node2) 
    {
        if (node1 == nullptr && node2 == nullptr) 
        {
            return true;
        }
        if (node1 == nullptr || node2 == nullptr) 
        {
            return false;
        }
        return (node1->data == node2->data) && compareTrees(node1->left, node2->left) && compareTrees(node1->right, node2->right);
    }

    Node* findNextUtil(Node* node, int value, Node*& successor) 
    {
        if (node == nullptr) 
        {
            return nullptr;
        }
        if (node->data == value) 
        {
            if (node->right != nullptr) 
            {
                Node* current = node->right;
                while (current->left != nullptr)
                {
                    current = current->left;
                }
                successor = current;
            }
            return node;
        }
        else if (value < node->data) 
        {
            successor = node;
            return findNextUtil(node->left, value, successor);
        }
        else 
        {
            return findNextUtil(node->right, value, successor);
        }
    }

    

public:
    BinarySearchTree() : root(nullptr) {};

    Node* getRoot()
    {
        return root;
    }

    void add(int value) 
    {
        root = addNode(root, value);
    }

    Node* search(int value)
    {
        return search(root, value);
    }

    void remove(int value) 
    {
        root = deleteNode(root, value);
    }

    bool compare(BinarySearchTree* other) 
    {
        return compareTrees(root, other->root);
    }

    Node* findNext(Node* start, const int value) 
    {
        Node* current = start;
        Node* successor = nullptr;

        while (current != nullptr) 
        {
            if (current->data > value) 
            {
                successor = current;
                current = current->left;
            }
            else 
            {
                current = current->right;
            }
        }

        return successor;
    }

    Node* find_successor()
    {
        Node* succesor = findSuccessor(root);
    }

    void levelOrder() {
        if (root == nullptr) {
            return;
        }

        std::queue<Node*> queue;
        queue.push(root);

        while (!queue.empty()) 
        {
            Node* current = queue.front();
            queue.pop();
            std::cout << current->data << " ";

            if (current->left != nullptr) 
            {
                queue.push(current->left);
            }

            if (current->right != nullptr) 
            {
                queue.push(current->right);
            }
        }
    }

    bool isEqual(BinarySearchTree& other) {         //Компаратор... с ним нужно что-то сделать...
        return isEqualRecursive(root, other.root);
    }

    bool isEqualRecursive(Node* node1, Node* node2) 
    {
        if (node1 == nullptr && node2 == nullptr) 
        {
            return true;
        }

        if (node1 != nullptr && node2 != nullptr) 
        {
            return (node1->data == node2->data) &&
                isEqualRecursive(node1->left, node2->left) &&
                isEqualRecursive(node1->right, node2->right);
        }

        return false;
    }

    void inOrderStack() {
        std::stack<Node*> stack;
        Node* current = root;

        while (current != nullptr || !stack.empty()) 
        {
            while (current != nullptr) 
            {
                stack.push(current);
                current = current->left;
            }

            current = stack.top();
            stack.pop();
            std::cout << current->data << " ";
            current = current->right;
        }
    }

    void inOrderRecursive(Node* node)
    {
        if (node != nullptr) {
            inOrderRecursive(node->left);
            std::cout << node->data << " ";
            inOrderRecursive(node->right);
        }
    }

    Node* findPrev(Node* start, int value) {
        Node* current = start;
        Node* predecessor = nullptr;

        while (current != nullptr) {
            if (current->data < value) {
                predecessor = current;
                current = current->right;
            }
            else {
                current = current->left;
            }
        }

        return predecessor;
    }

    int findMin() {
        Node* minNode = findMinNode(root);
        return minNode->data;
    }

    int findMax() {
        Node* maxNode = findMaxNode(root);
        return maxNode->data;
    }

    void inOrderTraversal() {
        inOrderRecursive(root);
    }
};