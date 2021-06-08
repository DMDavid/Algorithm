//
//  StringMothod.swift
//  算法demo
//
//  Created by dumeng on 2021/1/7.
//  Copyright © 2021 dumeng. All rights reserved.
//

extension ViewController {
    //反转字符串
    func reverseString(_ s: inout [Character]) {
        let totalCount = s.count
        var left = 0
        var right = totalCount - 1
        while left < right {
            let rightValue = s[right]
            s[right] = s[left]
            s[left] = rightValue
            
            left += 1
            right -= 1
        }
    }
    
    //合并有序2个数组
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard m <= nums1.count, n <= nums2.count else {
            return
        }
        
//        let newNum1 = nums1[0..<m]
//        let newNum2 = nums2[0..<n]
        
//        var num1 = [1,2,3,0,0,0]
//        var num2 = [2,5,6]
        
        //双指针
        var p1 = 0
        var p2 = 0
        
        var newList: [Int] = []
        
        while p1 < m, p2 < n {
            let item1 = nums1[p1]
            let item2 = nums2[p2]
            
            var item: Int
            if item1 < item2 {
                item = item1
                p1 += 1
            } else {
                item = item2
                p2 += 1
            }
            newList.append(item)
        }
        
        while p1 < m {
            let item1 = nums1[p1]
            newList.append(item1)
            p1 += 1
        }
        
        while p2 < n {
            let item2 = nums2[p2]
            newList.append(item2)
            p2 += 1
        }
        
        nums1 = newList
    }
    
    //查找只出现过一次的字符
    func firstUniqChar(_ s: String) -> Character {
        let stringList = s.map({ Character(extendedGraphemeClusterLiteral: $0) })
        var map: [Character: Int] = [:]
        
        for item in stringList {
            if let count = map[item] {
                let newCount = count + 1
                map[item] = newCount
                
            } else {
                map[item] = 1
            }
        }
        
        for item in stringList {
            if map[item] == 1 {
                return item
            }
        }
        
        return " "
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var newList: [Int] = []
        newList.append(contentsOf: nums1)
        newList.append(contentsOf: nums2)
        let new = newList.sorted { (value1, value2) -> Bool in
            return value1 < value2
        }
        if new.count%2 == 0 {
            let lastIndex = new.count/2
            let lastValue = Double(new[lastIndex])
            let firstValue = Double(new[lastIndex - 1])
            return (lastValue + firstValue)/2
        } else {
            let lastIndex = new.count/2
            let lastValue = new[lastIndex]
            return Double(lastValue)
        }
    }
}

extension ViewController {
    func reverse(_ x: Int) -> Int {
        var result = 0
        var digit = x
        
        while digit != 0 {
            let end = digit % 10
            result = result * 10 + end
            digit = digit/10
        }
        
        guard (result <= INT32_MAX && result >= -INT32_MAX - 1) else {
            return 0
        }
        
        return result
    }
}

/*
 9. 回文数
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。例如，121 是回文，而 123 不是。
 */
extension ViewController {
//    func isPalindrome(_ x: Int) -> Bool {
//        var list = Array(arrayLiteral: x)
//        
//    }
}
