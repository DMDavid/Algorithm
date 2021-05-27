//
//  ViewController+Extension1.swift
//  算法demo
//
//  Created by dumeng on 2020/11/3.
//  Copyright © 2020 dumeng. All rights reserved.
//



extension ViewController {
    /*
     实现一个算法，确定一个字符串 s 的所有字符是否全都不同。

     示例 1：

     输入: s = "leetcode"
     输出: false
     示例 2：

     输入: s = "abc"
     输出: true
     限制：
     */
    func isUnique(_ astr: String) -> Bool {
        let strList: [String.Element] = Array(astr)
        var maps: [String: Int] = [:]
        
        for item in strList {
            
            var count = 0
            if var value = maps[String(item)] {
                value += 1
                count = value
                if count > 1 {
                    return false
                }
            }
            maps[String(item)] = count
        }
        
        return true
    }
}


/*/
 1512. 好数对的数目
 给你一个整数数组 nums 。

 如果一组数字 (i,j) 满足 nums[i] == nums[j] 且 i < j ，就可以认为这是一组 好数对 。

 返回好数对的数目。
 示例 1：

 输入：nums = [1,2,3,1,1,3]
 输出：4
 解释：有 4 组好数对，分别是 (0,3), (0,4), (3,4), (2,5) ，下标从 0 开始
 示例 2：

 输入：nums = [1,1,1,1]
 输出：6
 解释：数组中的每组数字都是好数对
 示例 3：

 输入：nums = [1,2,3]
 输出：0
*/
extension ViewController {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
//        var resultList: [(Int, Int)] = []
//        for i in 0..<(nums.count - 1) {
//
//            for j in (i+1)..<nums.count {
//                let firstItem = nums[i]
//                let lastItem = nums[j]
//
//                if firstItem == lastItem {
//                    resultList.append((i, j))
//                }
//            }
//        }
//
//        return resultList.count
        
        //优化：
        var hashMap: [Int: Int] = [:]
        
        for item in nums {
            var newCount = hashMap[item] ?? 0
            newCount += 1
            hashMap[item] = newCount
        }
        
        var result = 0
        for value in hashMap.values {
            if value > 1 {
                let newValue = value
                let resultValue = newValue * (newValue - 1) / 2
                result += resultValue
            }
        }
        return result
    }
}

extension ViewController {
    /*
     1470. 重新排列数组
     给你一个数组 nums ，数组中有 2n 个元素，按 [x1,x2,...,xn,y1,y2,...,yn] 的格式排列。

     请你将数组按 [x1,y1,x2,y2,...,xn,yn] 格式重新排列，返回重排后的数组。
     示例 1：

     输入：nums = [2,5,1,3,4,7], n = 3
     输出：[2,3,5,4,1,7]
     解释：由于 x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 ，所以答案为 [2,3,5,4,1,7]
     示例 2：

     输入：nums = [1,2,3,4,4,3,2,1], n = 4
     输出：[1,4,2,3,3,2,4,1]
     示例 3：

     输入：nums = [1,1,2,2], n = 2
     输出：[1,2,1,2]
     */
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        guard n >= 1, n <= 500, nums.count%2 == 0 else { return [] }
//        //首先切分两个数组
//        let midIndex = nums.count/2
//        let firstList = Array(nums.prefix(midIndex))
//        let lastList = Array(nums.suffix(midIndex))
//
//        var result: [Int] = []
//        for i in 0..<midIndex {
//            result.append(firstList[i])
//
//            result.append(lastList[i])
//        }
//
//        return result
        
        
        var result: [Int] = []
        let midIndex = nums.count/2
        for i in 0..<nums.count {
            if i >= midIndex {
                return result
            }
            
            result.append(nums[i])
            
            result.append(nums[i+midIndex])
        }
        
        return result
    }
}
