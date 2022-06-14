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
        
        var sum = 0
        var a = 0
        var b = 1
        for _ in 0..<n {
            sum = (a + b) % 1000000007
            a = b
            b = sum
        }
        return a
    }
}

extension ViewController {
    /*
     70. 爬楼梯
     假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

     每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

     注意：给定 n 是一个正整数。

     示例 1：

     输入： 2
     输出： 2
     解释： 有两种方法可以爬到楼顶。
     1.  1 阶 + 1 阶
     2.  2 阶
     示例 2：

     输入： 3
     输出： 3
     解释： 有三种方法可以爬到楼顶。
     1.  1 阶 + 1 阶 + 1 阶
     2.  1 阶 + 2 阶
     3.  2 阶 + 1 阶
     */
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        // var dp = Array(repeating: 0, count: n+1)
        // dp[0] = 1
        // dp[1] = 1
        // dp[2] = 2
        // for i in 3...n {
        //     dp[i] = dp[i-1]+dp[i-2]
        // }
        // print(dp)
        // return dp[n]

        var num = 0
        var num1 = 1
        var num2 = 2
        for _ in 3...n {
            num = num1 + num2
            num1 = num2
            num2 = num
        }
    return num
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

extension ViewController {
    /*
     1、给定一个Int型数组，用里面的元素组成一个最大数，因为数字可能非常大，用字符串输出。

     输入: [3,30,34,5,9]
     输出: 9534330
     */
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
    func permute(_ nums: [Int]) -> [[Int]] {
        //设置一个保存是否使用过的数组 [false, false ,false]
        var visitedStausList = Array(repeating: false, count: nums.count)
        dfs(nums, [], &visitedStausList)
        return res
    }

    
    func dfs(_ nums: [Int], _ path: [Int], _ visitedStausList: inout [Bool]) {
        if path.count == nums.count {
            res.append(path)
            return
        }
        
        for index in 0..<nums.count {
            // 已经使用过，continue
            if visitedStausList[index] == true {
                continue
            }
            
            //第i个使用过
            visitedStausList[index] = true
            //组合
            let newList = [nums[index]] + path
            dfs(nums, newList, &visitedStausList)
            //重置
            visitedStausList[index] = false
        }
    }
}

extension ViewController {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0

        for (index, item) in bills.enumerated() {
            print("--\(index)")
            if item == 5 {
                five += 1

            } else if item == 10 {
                if five == 0 {
                    return false
                }
                five -= 1
                ten += 1

            } else if item == 20 {
                if ten == 0 {
                    //只有5元钱
                    if five >= 3 {
                        five -= 3
                    } else {
                        return false
                    }
                    
                } else {
                    if five > 0 {
                        five -= 1
                        ten -= 1
                    } else {
                        return false
                    }
                }
            }
        }

        return true
    }
    
    
//    func lemonadeChange(_ bills: [Int]) -> Bool {
//        var changeMoney = [Int]()
//
//        for item in bills {
//            print("--\(item)")
//            if item == 5 {
//                changeMoney.append(item)
//            } else {
//                var newMoney = item
//                var newList = [Int]()
//                for change in changeMoney {
//                    if change < newMoney, newMoney > 5 {
//                        newMoney = newMoney - change
//                    } else {
//                        newList.append(change)
//                    }
//                }
//
//                if newMoney != 5 {
//                    return false
//                }
//
//                newList.insert(item, at: 0)
//                changeMoney = newList
//            }
//        }
//        return true
//    }
}
