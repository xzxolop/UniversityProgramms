#include <cassert>
#include "BinTree.h"

using namespace std;

int main()
{
    BinarySearchTree bst;
    bst.add(50);
    bst.add(30);
    bst.add(70);
    bst.add(20);
    bst.add(40);

    std::cout << "In-order traversal (recursive): ";
    bst.inOrderRecursive(bst.getRoot());
    std::cout << std::endl;

    std::cout << "In-order traversal (stack): ";
    bst.inOrderStack();
    std::cout << std::endl;

    std::cout << "Level-order traversal: ";
    bst.levelOrder();
    std::cout << std::endl;

    BinarySearchTree bst2;
    bst2.add(50);
    bst2.add(30);
    bst2.add(70);
    bst2.add(20);
    bst2.add(40);

    if (bst.isEqual(bst2)) 
    {
        std::cout << "The two trees are identical." << std::endl;
    }
    else 
    {
        std::cout << "The two trees are not identical." << std::endl;
    }
    std::cout << "Max elem = " << bst.findMax() << std::endl;
    std::cout << "Min elem = " << bst.findMin() << std::endl;

    return 0;
}