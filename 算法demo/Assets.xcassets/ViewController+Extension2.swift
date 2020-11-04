//
//  ViewController+Extension2.swift
//  算法demo
//
//  Created by dumeng on 2020/11/4.
//  Copyright © 2020 dumeng. All rights reserved.
//


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
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        guard candies.count > 0 else { return [] }
        
        var maxItem = 0
        for item in candies {
            maxItem = maxItem > item ? maxItem : item
        }
        
        var list: [Bool] = []
        for item2 in candies {
            var newItem = extraCandies + item2
            if newItem >= maxItem {
                list.append(true)
            } else {
                list.append(false)
            }
        }
        
        return list
    }
}
