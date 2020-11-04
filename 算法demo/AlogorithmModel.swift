//
//  AlogorithmModel.swift
//  算法demo
//
//  Created by dumeng on 2020/10/27.
//  Copyright © 2020 dumeng. All rights reserved.
//

import Foundation

class AlogorithmModel {
    /*
     给定一个二叉树，返回它的 前序 遍历。

      示例:

     输入: [1,null,2,3]
        1
         \
          2
         /
        3

     输出: [1,2,3]
     进阶: 递归算法很简单，你可以通过迭代算法完成吗？

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
//    Definition for a binary tree node.
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
    
    class Solution {
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            
            var result: [Int] = []
            
            guard let value = root?.val else {
                return result
            }
            
            result.append(value)
            
            if let item = root?.left {
                result.append(contentsOf: preorderTraversal(item))
            }
            
            if let item = root?.right {
                result.append(contentsOf: preorderTraversal(item))
            }
            
            return result
        }
    }
}

extension AlogorithmModel {
    /*
     1207. 独一无二的出现次数
     给你一个整数数组 arr，请你帮忙统计数组中每个数的出现次数。

     如果每个数的出现次数都是独一无二的，就返回 true；否则返回 false。

      

     示例 1：

     输入：arr = [1,2,2,1,1,3]
     输出：true
     解释：在该数组中，1 出现了 3 次，2 出现了 2 次，3 只出现了 1 次。没有两个数的出现次数相同。
     示例 2：

     输入：arr = [1,2]
     输出：false
     示例 3：

     输入：arr = [-3,0,1,-3,1,1,1,-3,10,0]
     输出：true
     */
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var maps: [Int: Int] = [:]
        for item in arr {
            if var count = maps[item] {
                count += 1
                maps[item] = count
                
            } else {
                maps[item] = 1
            }
        }
        
        var mapList: [Int] = []
        for item in maps.values {
            if mapList.contains(item) {
                return false
            }
            mapList.append(item)
        }
        return true
    }
}

extension AlogorithmModel {
    /*
     1480. 一维数组的动态和
     给你一个数组 nums 。数组「动态和」的计算公式为：runningSum[i] = sum(nums[0]…nums[i]) 。

     请返回 nums 的动态和。

      

     示例 1：

     输入：nums = [1,2,3,4]
     输出：[1,3,6,10]
     解释：动态和计算过程为 [1, 1+2, 1+2+3, 1+2+3+4] 。
     示例 2：

     输入：nums = [1,1,1,1,1]
     输出：[1,2,3,4,5]
     解释：动态和计算过程为 [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1] 。
     示例 3：

     输入：nums = [3,1,2,10,1]
     输出：[3,4,6,16,17]
     */
    func runningSum(_ nums: [Int]) -> [Int] {
        var list: [Int] = []
        var currentResult = 0
        for item in nums {
            currentResult += item
            list.append(currentResult)
        }
        return list
    }
}

extension AlogorithmModel {
    /*
     剑指 Offer 58 - II. 左旋转字符串
     字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

     示例 1：

     输入: s = "abcdefg", k = 2
     输出: "cdefgab"
     示例 2：

     输入: s = "lrloseumgh", k = 6
     输出: "umghlrlose"
     */
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        let stringList = Array(s)
        guard n < stringList.count, n - 1 < stringList.count else { return s }
        
        var newString = ""
        let maxCount = stringList.count - 1
        newString = String(stringList[n...maxCount])
        let dealString = String(stringList[0...(n-1)])
        newString += dealString
        return newString
    }
}

// 树
extension AlogorithmModel {
    /*
     评论 (531)
     题解(647)
     提交记录
     129. 求根到叶子节点数字之和
     给定一个二叉树，它的每个结点都存放一个 0-9 的数字，每条从根到叶子节点的路径都代表一个数字。

     例如，从根到叶子节点路径 1->2->3 代表数字 123。

     计算从根到叶子节点生成的所有数字之和。

     说明: 叶子节点是指没有子节点的节点。

     示例 1:

     输入: [1,2,3]
         1
        / \
       2   3
     输出: 25
     解释:
     从根到叶子节点路径 1->2 代表数字 12.
     从根到叶子节点路径 1->3 代表数字 13.
     因此，数字总和 = 12 + 13 = 25.
     示例 2:

     输入: [4,9,0,5,1]
         4
        / \
       9   0
      / \
     5   1
     输出: 1026
     解释:
     从根到叶子节点路径 4->9->5 代表数字 495.
     从根到叶子节点路径 4->9->1 代表数字 491.
     从根到叶子节点路径 4->0 代表数字 40.
     因此，数字总和 = 495 + 491 + 40 = 1026.
     */
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        return doSumNumbers(root, preSum: 0)
    }
    
    func doSumNumbers(_ root: TreeNode?, preSum: Int) -> Int {
        guard let rootValue = root else {
            return 0
        }
        
        let sum: Int = preSum * 10  + rootValue.val
        if root?.left == nil && root?.right == nil {
            return sum
        } else {
            return doSumNumbers(root?.left, preSum: sum) + doSumNumbers(root?.right, preSum: sum)
        }
    }
}

