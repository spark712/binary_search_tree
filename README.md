## Binary Search Tree

Implementation of Binary Search tree in ruby as part of "The Odin Project" curriculum.

### Definition

A binary search tree (BST), also called an ordered or sorted binary tree, is a rooted binary tree whose internal nodes each store a key greater than all the keys in the node's left subtree and less than those in its right subtree. A binary tree is a type of data structure for storing data such as numbers in an organized way.[wikipedia](https://en.wikipedia.org/wiki/Binary_search_tree)

### Methods Implemented
1. A #build_tree method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of Node objects appropriately placed (sorted and unique elements). The #build_tree method returns the level-1 root node.
2. An #insert method which accepts a value to insert.
3. A #delete method which accepts a value to delete
4. A #find method which accepts a value and returns the node with the given value.
5. A #level_order method that returns an array of values. This method traverses the tree in breadth-first level order. This method has be implemented using both iteration and recursion.
6. #inorder, #preorder, and #postorder methods that returns an array of values. Each method traverses the tree in their respective depth-first order.
7. A #height method which accepts a node and returns its height.
8. A #depth method which accepts a node and returns its depth. [Difference between height and depth](https://stackoverflow.com/questions/2603692/what-is-the-difference-between-tree-depth-and-height#:~:text=The%20depth%20of%20a%20node,have%20a%20height%20of%200.)
9. A a #balanced? method which checks if the tree is balanced. (This method has not been tested well enough.)
10. A #rebalance method which rebalances an unbalanced tree.
