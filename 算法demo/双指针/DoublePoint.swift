//
//  DoublePoint.swift
//  算法demo
//
//  Created by dumeng01 on 2021/10/13.
//  Copyright © 2021 dumeng. All rights reserved.
//

import Foundation

extension ViewController {
    /*
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
     示例:
     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]

     [2, 1]
     
     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/move-zeroes
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 0 else { return }
        var a = 0, b = 1
        while (b < nums.count && a < b) {
            if nums[a] == 0 && nums[b] != 0 {
                let tem = nums[b]
                nums[b] = nums[a]
                nums[a] = tem
            }
            
            b += 1
            if nums[a] != 0 {
                a += 1
            }
        }
    }
}


extension ViewController {
    /*
     557. 反转字符串中的单词 III
     给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

      

     示例：

     输入："Let's take LeetCode contest"
     输出："s'teL ekat edoCteeL tsetnoc"
     */
    func reverseWords(_ s: String) -> String {
        var newList: [[Character]] = []
        var subList: [Character] = []
        for str in Array(s) {
            if str != " " {
                subList.append(str)
            } else {
                newList.append(subList)
                subList = []
            }
        }
        if subList.count > 0 {
            newList.append(subList)
        }
        
        var result = ""
        for (index, item) in newList.enumerated() {
            if index == 0 {
                let string = reverseSubWord(list: item)
                result.append(string)
            } else {
                let string = reverseSubWord(list: item)
                result.append(" " + string)
            }
        }
        return result
    }
    
    func reverseSubWord(list: [Character]) -> String {
        var newList = list
        var start = 0, end = newList.count - 1
        while start < end {
            let tem = newList[end]
            newList[end] = newList[start]
            newList[start] = tem
            
            start += 1
            end -= 1
        }
        
        var resultStr = ""
        for item in newList {
            resultStr.append(item)
        }
        return resultStr
    }
}

extension ViewController {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else { return 0 }

        var best = nums[0] + nums[1] + nums[2]

        //排序
        let newNums = nums.sorted { value1, value2 in
            return value1 < value2
        }

        for (index, item) in newNums.enumerated() {
            var left = index + 1
            var right = newNums.count - 1
            
            while left < right {
                let sum = newNums[left] + newNums[right] + item

                if sum == target {
                    return target

                }

                if abs(sum - target) < abs(best - target) {
                    best = sum
                }
                
                if sum > target {
                    right -= 1

                } else {
                    left += 1
                }
            }
        }

        return best
    }
}
