//
//  Tree.swift
//  算法demo
//
//  Created by dumeng on 2020/12/3.
//  Copyright © 2020 dumeng. All rights reserved.
//

import UIKit

class Tree_node: NSObject {
    var value: Int
    var left_node: Tree_node?
    var right_node: Tree_node?
    
    public init(_ value: Int, left: Tree_node?, right: Tree_node?) {
        self.value = value
        self.left_node = left
        self.right_node = right
    }
}

class Tree: NSObject {
    
    func serialization(list: [Int]) -> Tree_node? {
        guard list.count != 0 else { return nil }
        
        var tree: Tree_node?
        //[62,58,88,47,73,99,35,51,93,29,37,49,56,36,48,50]
        for (index, item) in list.enumerated() {
            
            if index == 0 {
                tree = Tree_node(item, left: nil, right: nil)
            } else {
                tree = getTreeNode(num: item, targetTree: tree!)
            }
        }
        
        return tree
    }
    
    func getTreeNode(num: Int, targetTree: Tree_node?) -> Tree_node? {
        guard let tree = targetTree else { return nil }
        if num < tree.value {
            var left_node: Tree_node? = Tree_node(num, left: nil, right: nil)
            if let item = tree.left_node {
                left_node = getTreeNode(num: num, targetTree: item)
            }
            tree.left_node = left_node
            
        } else {
            var right_node: Tree_node? = Tree_node(num, left: nil, right: nil)
            if let item = tree.right_node {
                right_node = getTreeNode(num: num, targetTree: item)
            }
            tree.right_node = right_node
        }
        return tree
    }
    
    
    func findCount(treeNode: Tree_node?, count: Int) -> Tree_node? {
        guard let tree = treeNode else { return nil }
        
        if tree.value < count {
            return findCount(treeNode: tree.right_node, count: count)
        } else {
            return findCount(treeNode: tree.left_node, count: count)
        }
    }
}

/**
 * leetcode 104: 求树的最大深度
 * @param node
 * @return
 */
extension ViewController {
    func maxDepth(_ root: Tree_node?) -> Int {
        if root == nil {
            return 0
        }
        
        var leftDepth = maxDepth(root?.left_node) + 1
        var rightDepth = maxDepth(root?.right_node) + 1
        return max(leftDepth, rightDepth)
    }
}

/**
 * leetcode 111: 求树的最小深度
 * @param node
 * @return
 */
extension ViewController {
    func minDepth(_ root: Tree_node?) -> Int {
        if (root == nil) {
            return 0
        }

        if (root?.left_node == nil) {
            return 1 + minDepth(root?.right_node)
        }

        if (root?.right_node == nil) {
            return 1 + minDepth(root?.left_node)
        }

        var leftDepth = minDepth(root?.left_node);
        var rightDepth = minDepth(root?.right_node);
        return 1 + min(leftDepth, rightDepth)
    }
}
