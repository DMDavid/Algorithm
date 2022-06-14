//
//  Array.swift
//  算法demo
//
//  Created by dumeng01 on 2022/4/18.
//  Copyright © 2022 dumeng. All rights reserved.
//

import Foundation

extension ViewController {
    //15. 三数之和
    //给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
    func threeSum(_ nums: [Int]) -> [[Int]] {
        //如果没有3个数返回
        if nums.count < 3 {
            return []
        }
        
        //排序
        let new = nums.sorted { value1, value2 in
            return value1 < value2
        }
        
        print("排序后：\(new)")
        
        //判断最小的是不是大于 0
        if new.first! > 0 {
            return []
        }
        
        //结果数组
        var result = [[Int]]()
        
        for (index, item) in new.enumerated() {
            
            if (index > 0 && new[index] == new[index - 1]) {
                continue
            }
                
            //左右指针
            var left = index + 1
            var right = new.count - 1
            
            while left < right {
                let value = new[index] + new[left] + new[right]
                if value == 0 {
                    result.append([new[index], new[left], new[right]])
                    
                    while (left < right) && new[left + 1] == new[left] {
                        left += 1
                    }
                    
                    while (left < right) && new[right - 1] == new[right] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                    
                } else if value > 0 {
                    //说明右边的数字太大了
                    right -= 1
                } else {
                    //说明左边的数字太小了
                    left += 1
                }
            }
        }
        
        return result
    }
    
    
    
    
    func maxSubArray(_ nums: [Int]) -> Int {
        var pre = 0, maxCount = nums[0]
        for item in nums {
            //判断当前的数字 是否比 当前数字+之前数字大
            // 如果 相加的数字 都比 之前数字小的话，说明不是最大的
            pre = max(pre, pre + item)
            maxCount = max(maxCount, maxCount + pre)
        }
        return maxCount
    }
}

extension ViewController {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        var slow = 0
        var fast = 1
        
        while fast < nums.count {
            if nums[fast] != nums[slow] {
                slow += 1
                nums.swapAt(fast, slow)
            }
            
            fast += 1
        }
        print("\(nums)")
        return slow + 1
        
//        while fast < nums.count {
//            if nums[slow] != nums[fast] {
//                nums.swapAt(fast, slow+1)
//                slow = slow+1
//            }
//
//            fast += 1
//        }
        
//        return slow+1
    }
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        var map: [Int : Int] = [:]
//        for item in nums {
//            map[item] = 1
//        }
//
//        nums = Array(map.keys) as [Int]
//        nums = nums.sorted { num1, num2 in
//            return num1 < num2
//        }
//        return map.keys.count
//    }
}
