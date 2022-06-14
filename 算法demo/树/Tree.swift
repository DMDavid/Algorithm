//
//  Tree.swift
//  算法demo
//
//  Created by dumeng on 2020/12/3.
//  Copyright © 2020 dumeng. All rights reserved.
//

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

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
        if root == nil { return 0 }
        
        if root?.left_node == nil {
            return minDepth(root?.right_node) + 1
        }
        
        if root?.right_node == nil {
            return minDepth(root?.left_node) + 1
        }
        
        var leftDepth = minDepth(root?.left_node)
        var rightDepth = minDepth(root?.right_node)
        return 1 + min(leftDepth, rightDepth)
    }
}


//判断一个树，是否是平衡二叉树
extension ViewController {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil { return true }

        if (abs(getMaxDepth(root: root?.left) - getMaxDepth(root: root?.right)) <= 1) && isBalanced(root?.left) && isBalanced(root?.right) {
            return true
        } else {
            return false
        }
    }

    //求深度
    func getMaxDepth(root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var leftDepth = getMaxDepth(root: root?.left) + 1
        var rightDepth = getMaxDepth(root: root?.right) + 1
        return max(leftDepth, rightDepth)
    }
}


//路径总和
/*
 112. 路径总和 https://leetcode-cn.com/problems/path-sum/
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum ，判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。

 叶子节点 是指没有子节点的节点。

 示例 1：
 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 输出：true
 示例 2：


 输入：root = [1,2,3], targetSum = 5
 输出：false
 示例 3：

 输入：root = [1,2], targetSum = 0
 输出：false
 */
extension ViewController {
    //BFS 广度
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let node = root else { return false }
        
        var queue = [TreeNode]()
        var valQueue = [Int]()
        //加入队列
        queue.append(node)
        valQueue.append(node.val)
        
        while !queue.isEmpty {
            let targetNode = queue.first
            queue.removeFirst()
            
            let val = valQueue.first ?? 0
            valQueue.removeFirst()
            
            if targetNode?.left == nil && targetNode?.right == nil {
                if val == targetSum {
                    return true
                }
                continue
            }
            
            if let leftNode = targetNode?.left {
                queue.append(leftNode)
                valQueue.append(leftNode.val + val)
            }
            
            if let rightNode = targetNode?.right {
                queue.append(rightNode)
                valQueue.append(rightNode.val + val)
            }
        }
        
        return false
    }
    
    
    //#递归 相减  sum - val
    //***
//    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//        guard let node = root else { return false }
//
//        if root?.left == nil && root?.right == nil {
//            return targetSum == node.val
//        }
//
//        return hasPathSum(root?.left, targetSum - node.val) || hasPathSum(root?.right, targetSum - node.val)
//    }
}

extension ViewController {
    // 广度
    func bfs(node: Tree_node) -> [Int] {
        var queue = [Tree_node]()
        queue.append(node)
        var list = [Int]()
        while !queue.isEmpty {
            let targetNode = queue.first
            queue.removeFirst()
            
            if let value = targetNode?.value {
                list.append(value)
            }
            
            if let leftNode = targetNode?.left_node {
                queue.append(leftNode)
            }
            if let rightNode = targetNode?.right_node {
                queue.append(rightNode)
            }
        }
        
        return list
    }
    
    /**
     * leetcdoe 102: 二叉树的层序遍历, 使用 bfs
     * [1]
     *  [2, 3]
     *  [4 , 5 , 6]
     * @param root
     */
    func bfsTest1(node: Tree_node) -> [[Int]] {
        var queue = [Tree_node]()
        queue.append(node)
        var list = [[Int]]()
        
        while !queue.isEmpty {
            var level = [Int]()
            var count = queue.count
            
            for _ in 0..<count {
                let targetNode = queue.first
                queue.removeFirst()
                
                if let leftNode = targetNode?.left_node {
                    queue.append(leftNode)
                }
                if let rightNode = targetNode?.right_node {
                    queue.append(rightNode)
                }
                
                if let value = targetNode?.value {
                    level.append(value)
                }
            }
            list.append(level)
        }
        
        return list
    }
    
    // 深度
    func dfs(node: Tree_node?) -> [Int] {
        var result = [Int]()
        if node == nil {
            return result
        }
        
        if let value = node?.value {
            result.append(value)
        }
        
        let leftList = dfs(node: node?.left_node)
        result.append(contentsOf: leftList)
        
        let rightList = dfs(node: node?.right_node)
        result.append(contentsOf: rightList)
        
        return result
    }
}


//验证二叉搜索树
//左树 < 根
//右树 > 根
extension ViewController {
    
    //1. 遍历
    public func isValidBST(_ root: TreeNode?) -> Bool {
        if (root == nil) { return true }

        return valid(root, Int.min, Int.max)
    }

    public func valid(_ root: TreeNode? ,_ low: NSInteger,_ high: NSInteger) -> Bool {
        guard let node = root else { return true }

        if (node.val <= low || node.val >= high) { return false }
        
        return valid(node.left, low, node.val) && valid(node.right, node.val, high);
    }
    
    
    //1。中序遍历, 存放所有遍历的元素，然后判断是否是升序
    func isValidBST_2(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        
        var list = zhongXu(root)
        
        for i in 0..<list.count - 1 {
            if list[i] >= list[i+1] {
                return false
            }
        }
        return true
    }
    
    func zhongXu(_ root: TreeNode?) -> [Int] {
        guard let node = root else {
            return []
        }
        
        var result = [Int]()
        if let nodeTree = node.left {
//            result.append(nodeTree.val)
            result.append(contentsOf: zhongXu(nodeTree))
        }
        
        result.append(node.val)
        
        if let nodeTree = node.right {
//            result.append(nodeTree.val)
            result.append(contentsOf: zhongXu(nodeTree))
        }
        
        return result
    }
}

//对称二叉树
/*
 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/symmetric-tree/solution/dui-cheng-er-cha-shu-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
extension ViewController {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return check(root, root)
    }
    
    func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }
        
        return p?.val == q?.val && check(p?.left, q?.right) && check(p?.right, q?.left)
    }
}


/*
 剑指 Offer II 056. 二叉搜索树中两个节点之和
 */
extension ViewController {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var setList = [Int]()
        func dfs(_ root: TreeNode?) -> Bool {
            guard let tree = root else { return false }
            
            if setList.contains(k - tree.val) { return true }
            setList.append(tree.val)
            return dfs(tree.left) || dfs(tree.right)
        }
        
        return dfs(root)
    }
}

extension ViewController {
    /*
     层序遍历
     */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var result = [[Int]]()
        
        var queue = [TreeNode?]()
        queue.append(root)
        while !queue.isEmpty {
            var level = [Int]()
            let count = queue.count
            for _ in 0..<count {
                let node = queue.removeFirst()
                level.append(node!.val)
                if node?.left != nil {
                    queue.append(node?.left)
                }
                if node?.right != nil {
                    queue.append(node?.right)
                }
            }
            result.append(level)
        }
        
        return result
    }
}
