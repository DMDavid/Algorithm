//
//  File.swift
//  算法demo
//
//  Created by dumeng on 2021/5/27.
//  Copyright © 2021 dumeng. All rights reserved.
//

extension ViewController {
    func search ( _ nums: [Int],  _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        return getNumber(0, nums.count-1, nums, target)
    }

    //二分
    //left = 0, right = count -1
    // mid = (right - left)/2 + left
    func getNumber(_ left: Int, _ right: Int, _ nums: [Int], _ target: Int) -> Int {
        if left == right {
            if nums[left] == target {
                return left
            }
            return -1
        }
        
        if (right - left) == 1 {
            if nums[left] == target {
                return left
            } else if nums[right] == target {
                return right
            } else {
                return -1
            }
        }
        
        let middle = left + (right - left)/2
        let currentNum = nums[middle]
        if currentNum > target {
            return getNumber(left, middle, nums, target)
            
        } else if currentNum < target {
            return getNumber(middle, right, nums, target)
            
        } else if currentNum == target {
            return middle
        }

        return -1
    }

    
}
