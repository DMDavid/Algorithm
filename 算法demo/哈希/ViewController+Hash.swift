//
//  ViewController+Hash.swift
//  算法demo
//
//  Created by dumeng on 2021/5/28.
//  Copyright © 2021 dumeng. All rights reserved.
//

extension ViewController {
    /*
     219. 存在重复元素 II
     给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的 绝对值 至多为 k。

     https://leetcode-cn.com/problems/contains-duplicate-ii/
     */
    
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int: Int]()
        for (index, item) in nums.enumerated() {
            if let i = dict[item] {
                if index - i <= k { return true }
            }
            dict[item] = index
        }
        return false
    }
}

extension ViewController {
    /*
     1. 两数之和
     给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

     你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

     你可以按任意顺序返回答案。

      

     示例 1：

     输入：nums = [2,7,11,15], target = 9
     输出：[0,1]
     解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
     示例 2：

     输入：nums = [3,2,4], target = 6
     输出：[1,2]
     示例 3：

     输入：nums = [3,3], target = 6
     输出：[0,1]
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for (index, item) in nums.enumerated() {
            if let valueIndex = map[target - item] {
                return [valueIndex, index]
            }
            map[item] = index
        }
        return []
    }
}
