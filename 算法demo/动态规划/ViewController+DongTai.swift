//
//  ViewController+DongTai.swift
//  算法demo
//
//  Created by dumeng on 2021/5/27.
//  Copyright © 2021 dumeng. All rights reserved.
//

extension ViewController {
    /*
     剑指 Offer 10- I. 斐波那契数列
     写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

     F(0) = 0,   F(1) = 1
     F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
     斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

     答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
     
     示例 1：

     输入：n = 2
     输出：1
     示例 2：

     输入：n = 5
     输出：5
     */
    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        
        var a = 0, b = 1, sum = 0
        for _ in 0..<n {
            sum = (a + b) % 1000000007
            a = b
            b = sum
        }
        return a
    }
}

extension ViewController {
    func islandPerimeter1(_ grid: [[Int]]) -> Int {
        var land = 0    // 土地个数
        var border = 0  // 接壤边界的条数

        for j in 0..<grid.count { // 第j行
            for i in 0..<grid[0].count { // 第i列
                if (grid[j][i] == 1) {
                    land = land + 1

                    // 计算右边的边界接壤的个数
                    if i < grid[0].count - 1, grid[j][i + 1] == 1 {
                        border = border + 1
                    }

                    // 计算下边的边界接壤的个数
                    if j + 1 < grid.count, j < grid.count - 1, grid[j + 1][i] == 1 {
                        border = border + 1
                    }
                }
            }
        }

        // 每个岛屿边长为4，两个岛屿相交，则两则总边长减2
        return 4 * land - 2 * border;
    }
}

/*
 1365. 有多少小于当前数字的数字
 给你一个数组 nums，对于其中每个元素 nums[i]，请你统计数组中比它小的所有数字的数目。

 换而言之，对于每个 nums[i] 你必须计算出有效的 j 的数量，其中 j 满足 j != i 且 nums[j] < nums[i] 。

 以数组形式返回答案。

  

 示例 1：

 输入：nums = [8,1,2,2,3]
 输出：[4,0,1,1,3]
 解释：
 对于 nums[0]=8 存在四个比它小的数字：（1，2，2 和 3）。
 对于 nums[1]=1 不存在比它小的数字。
 对于 nums[2]=2 存在一个比它小的数字：（1）。
 对于 nums[3]=2 存在一个比它小的数字：（1）。
 对于 nums[4]=3 存在三个比它小的数字：（1，2 和 2）。
 示例 2：

 输入：nums = [6,5,4,8]
 输出：[2,1,0,3]
 示例 3：

 输入：nums = [7,7,7,7]
 输出：[0,0,0,0]
  

 提示：

 2 <= nums.length <= 500
 0 <= nums[i] <= 100
 */
extension ViewController {
    func smallerNumbersThanCurrent2(_ nums: [Int]) -> [Int] {
        var resultDict: [Int: Int] = [:]
        let newNums = nums.sorted()
        var currentNum: Int = 0
        var repeatNumCount: Int = 1  //出现重复的数字 +1
        for (index, item) in newNums.enumerated() {
            if currentNum == item {
                var count = index - repeatNumCount
                count = count < 0 ? 0 : count
                resultDict[item] = count
                repeatNumCount += 1
            } else {
                resultDict[item] = index
                repeatNumCount = 1
            }
            currentNum = item
        }
        
        var result: [Int] = []
        for item in nums {
            result.append(resultDict[item]!)
        }
        return result
    }
    
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var resultList: [Int] = []
        for item in nums {
            
            var count = 0
            for item2 in nums {
                if item == item2 {
                    continue
                }
                if item > item2 {
                    count += 1
                }
            }
            resultList.append(count)
        }
        return resultList
    }
}

extension ViewController {
    /*
     941. 有效的山脉数组
     给定一个整数数组 A，如果它是有效的山脉数组就返回 true，否则返回 false。

     让我们回顾一下，如果 A 满足下述条件，那么它是一个山脉数组：

     A.length >= 3
     在 0 < i < A.length - 1 条件下，存在 i 使得：
     A[0] < A[1] < ... A[i-1] < A[i]
     A[i] > A[i+1] > ... > A[A.length - 1]
      
     示例 1：

     输入：[2,1]
     输出：false
     示例 2：

     输入：[3,5,5]
     输出：false
     示例 3：

     输入：[0,3,2,1]
     输出：true
     */
    
    func validMountainArray(_ A: [Int]) -> Bool {
        guard A.count > 2 else { return false }
        let lenth = A.count
        var left = 0
        var right = lenth - 1
        
        while left + 1 < lenth, A[left] < A[left + 1] {
            left += 1
        }
        
        while right > 0,  A[right - 1] > A[right] {
            right -= 1
        }
        
        if left != 0, right < lenth - 1, left == right {
            return true
        }
        
        return false
    }
}

/*
 1、给定一个Int型数组，用里面的元素组成一个最大数，因为数字可能非常大，用字符串输出。

 输入: [3,30,34,5,9]
 输出: 9534330
 */

extension ViewController {
    func largestNumber(_ nums: [Int]) -> String {
        let sort = nums.map {"\($0)"}.sorted { (lStr, rStr) -> Bool in
            let s1 = lStr + rStr
            let s2 = rStr + lStr
            return lStr + rStr > rStr + lStr
        }
        let result = sort.joined()
        if result.prefix(1) == "0" {
            return "0"
        } else {
            return result
        }
    }
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
