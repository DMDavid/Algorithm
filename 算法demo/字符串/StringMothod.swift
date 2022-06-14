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

extension ViewController {
    /*
     3. 无重复字符的最长子串
     给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

     示例 1:
     输入: s = "abcabcbb"
     输出: 3
     解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
     
     示例 2:
     输入: s = "bbbbb"
     输出: 1
     解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
     
     示例 3:
     输入: s = "pwwkew"
     输出: 3
     解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
          请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 记录出现字符串的索引
        var map = [Character : Int]()
        var left = 0
        var result = 0
        for (index, char) in s.enumerated() {
            let preIndex = map[char] ?? -1
            if preIndex >= left {
                left = preIndex + 1
            }
            
            let currentLength = index - left + 1
            result = max(currentLength, result)
            map[char] = index
        }
        return result
    }
}

extension ViewController {
    //滑动窗口
    /*
     567. 字符串的排列
     给你两个字符串 s1 和 s2 ，写一个函数来判断 s2 是否包含 s1 的排列。如果是，返回 true ；否则，返回 false 。
     换句话说，s1 的排列之一是 s2 的 子串 。
     
     示例 1：
     输入：s1 = "ab" s2 = "eidbaooo"
     输出：true
     解释：s2 包含 s1 的排列之一 ("ba").
     
     示例 2：
     输入：s1= "ab" s2 = "eidboaoo"
     输出：false
     */
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dic1: [Character : Int] = [:]

        //放入哈希表中（字典)
        for char in s1 {
            dic1.updateValue((dic1[char] ?? 0) + 1, forKey: char)
        }

        //s2 数组
        let str2 = Array(s2)
        var dic2: [Character : Int] = [:]

        var start = -1

        for (index, char) in str2.enumerated() {
            if index >= s1.count{
                //s2的个数要大于等于s1
                start += 1
                let startChar = str2[start]
                if dic2[startChar] == 1 {
                    //步骤一：移动s2的dict2窗口
                    dic2.removeValue(forKey: startChar)
                } else {
                    dic2.updateValue((dic2[startChar] ?? 0)-1, forKey: startChar)
                }
            }
            //步骤二：移动s2的dict2窗口
            dic2.updateValue((dic2[char] ?? 0) + 1, forKey: char)
            
            //直到满足为止
            if dic1 == dic2{
                return true
            }
        }
        return false
    }
}

extension ViewController {
    func longestPalindrome(_ s: String) -> Int {
        let list = Array(s)
        var map: [Character: Int] = [:]
        for item in list {
            if let count = map[item] {
                map[item] = count + 1
            } else {
                map[item] = 1
            }
        }
        
        var lenth = 0
        var oddNumber = 0
        for key in map.keys {
            if let count = map[key] {
                
                // 偶数
                if count % 2 == 0 {
                    lenth += count
                    
                } else {
                    //奇数
                    lenth += count - 1
                    oddNumber = 1
                }
            }
        }

        return lenth + oddNumber
    }
}

extension ViewController {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n < k {
            return [[]]
        }
        
        var nums = [Int]()
        for i in 1...n {
            nums.append(i)
        }
        
        var visited = Array(repeating: false, count: nums.count)
        helper(k, nums, [], &visited)
        return res
    }
    
    func helper(_ k: Int, _ list: [Int], _ path: [Int], _ visited: inout [Bool]) {
        if path.count == k {
            res.append(path)
            return
        }
        
        for index in 0..<list.count {
            if visited[index] == true {
                continue
            }
            
            let currentNum = list[index]
            
            visited[index] = true
            helper(k, list, path + [currentNum], &visited)
            visited[index] = false
        }
    }
    
//    func helper(_ k: Int, _ begin: Int, _ list: [Int], _ path: [Int]) {
//        if path.count == k {
//            res.append(path)
//            return
//        }
//
//        for index in begin..<list.count {
//            let currentNum = list[index]
//            helper(k, index + 1, list, path + [currentNum])
//        }
//    }

//    func helper(_ k: Int, _ begin: Int, _ list: [Int], _ path: [Int], _ visited: inout [Bool]) {
//        if path.count == k {
//            print("path --- \(path)")
//            res.append(path)
//            return
//        }
//
//        for index in begin..<list.count {
////            // 已经使用过，continue
////            if visited[index] == true {
////                continue
////            }
//
//            let currentNum = list[index]
////            visited[index] = true
//            helper(k, index + 1, list, path + [currentNum], &visited)
////            visited[index] = false
//        }
//    }
    
}

extension ViewController {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        //找出最小的一个
        var minStr = ""
        for subStr in strs {
            if minStr.count < subStr.count {
                minStr = subStr
            }
        }

        var minCount = minStr.count
        while minCount > 0 {
            let beginIndex = String.Index.init(encodedOffset: 0)
            let endIndex = String.Index.init(encodedOffset: minCount)
            let str = minStr[beginIndex..<endIndex]
            
            var include = true
            
            
            for subStr in strs {
                if !subStr.hasPrefix(str) {
                    include = false
                    break
                }
            }
            
            minCount -= 1
            
            //包括
            if include {
                return String(str)
            }
        }
        return ""
        
        var list = [Int]()
        list.sorted(by: { $0 < $1 })
    }
}

extension ViewController {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var sortedG = g.sorted(by: { $0 < $1 })
        var sortedS = s.sorted(by: { $0 < $1 })

        var index = 0
        var count = 0
        for children in sortedG {
            while index < sortedS.count {
                var cookie = sortedS[index]
                index += 1
                if children <= cookie {
                    count += 1
                    break
                }
            }
        }

        return count
    }
}

extension ViewController {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var maxCount = 0
        var prev = -1

        for (index, item) in flowerbed.enumerated() {
            if item > 0 {
                if prev < 0 {
                    maxCount += index / 2
                } else {
                    maxCount += (index - prev - 2) / 2
                }
                prev = index
            }
        }

        // 没有种植过任何的❀
        if prev < 0 {
            maxCount += (flowerbed.count + 1) / 2
        } else {
            maxCount += (flowerbed.count - prev - 1) / 2
        }

        return maxCount >= n
    }
}

extension ViewController {
    func validPalindrome(_ s: String) -> Bool {
        let list = Array(s)
        
        var left = 0
        var right = list.count-1

        while left <= right {
            if list[left] == list[right] {
                left += 1
                right -= 1

            } else {

                if isValidPalindrome(left + 1, right, list) || isValidPalindrome(left, right - 1, list) {
                    return true
                } else {
                    return false
                }
            }
        }

        return true
    }

    func isValidPalindrome(_ left: Int, _ right: Int, _ list: [Character]) -> Bool {
        var newLeft = left
        var newRight = right

        while newLeft <= newRight {
            if list[newLeft] == list[newRight] {
                newLeft += 1
                newRight -= 1
            } else {
                return false
            }
        }

        return true
    }
}
