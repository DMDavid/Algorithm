//
//  StringMothod.swift
//  算法demo
//
//  Created by dumeng on 2021/1/7.
//  Copyright © 2021 dumeng. All rights reserved.
//

extension ViewController {
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
