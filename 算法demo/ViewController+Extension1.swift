//
//  ViewController+Extension1.swift
//  算法demo
//
//  Created by dumeng on 2020/11/3.
//  Copyright © 2020 dumeng. All rights reserved.
//


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

/*
 请判断一个链表是否为回文链表。

 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
extension ViewController {
    func test2() {
        
        let model = Solution()
        
        let one = ListNode(1)
        let two = ListNode(-2)
        let three1 = ListNode(3)
        
        let three2 = ListNode(6)
        let three3 = ListNode(6)
        
        let three4 = ListNode(3)
        let three = ListNode(-2)
        let four = ListNode(1)
        
        one.next = two
        two.next = three1
        three1.next = three2
        three2.next = three3
        three3.next = three4
        three4.next = three
        three.next = four
        
        //        let one = ListNode(1)
        //        let two = ListNode(2)
        //        one.next = two
        
        //        print("\(model.isPalindrome(one))")
        
        print("\(isPalindrome(one))")
    }
    
    // 遍历，中分，反转一个list，两个list比较
    class Solution {
        func isPalindrome(_ head: ListNode?) -> Bool {
            guard let testHeader = head else { return true }
            
            var list:[Int] = []
            var temHeader: ListNode?
            
            temHeader = testHeader
            list.append(testHeader.val)
            
            while temHeader != nil {
                temHeader = temHeader?.next
                if let value = temHeader?.val {
                    list.append(value)
                }
            }
            
            var intermediate = list.count / 2
            guard intermediate < list.count, intermediate >= 0 else { return false }
            let firstList: [Int] = Array(list.prefix(intermediate))
            var lastList: [Int] = Array(list.suffix(intermediate))
            
            let newLastList = Array(lastList.reversed())
            
            if firstList.count != newLastList.count, firstList != newLastList { return false }
            for (index, item) in firstList.enumerated() {
                let value = newLastList[index]
                if value != item {
                    return false
                }
            }
            
            return true
        }
    }

        //快慢指针
    func isPalindrome(_ l1: ListNode?) -> Bool {
        if l1 == nil || l1?.next == nil {
            return false
        }
        
        var fast = l1
        var slow = l1
        var nodeArr:[Int] = [Int]()
        nodeArr.append(l1!.val)
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            nodeArr.append(slow!.val)
        }
        
        while slow?.next != nil {
            if nodeArr.count != 0 {
                if nodeArr.removeLast() != slow?.next?.val {
                    return false
                }
            } else {
                return false
            }
            slow = slow?.next
        }
        return true
    }
}

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
        
        
//        let strList = Array(astr)
//
//        for index in 0..<strList.count {
//            let oneStr = strList[index]
//
//            for (insideIndex, str) in strList.enumerated() {
//                if insideIndex == index { continue }
//                if str == oneStr {
//                    return false
//                }
//            }
//        }
//        return true
    }
}
