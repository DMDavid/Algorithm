## 704. 二分查找
https://leetcode-cn.com/problems/binary-search/
给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。
示例 1:

输入: nums = [-1,0,3,5,9,12], target = 9
输出: 4
解释: 9 出现在 nums 中并且下标为 4
示例 2:

输入: nums = [-1,0,3,5,9,12], target = 2
输出: -1
解释: 2 不存在 nums 中因此返回 -1

    func search ( _ nums: [Int],  _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        return getNumber(0, nums.count-1, nums, target)
    }
    
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




## LeetCode 91. 解码方法
https://leetcode-cn.com/problems/decode-ways/
一条包含字母 A-Z 的消息通过以下映射进行了 编码 ：

'A' -> 1
'B' -> 2
...
'Z' -> 26
要 解码 已编码的消息，所有数字必须基于上述映射的方法，反向映射回字母（可能有多种方法）。例如，"11106" 可以映射为：

"AAJF" ，将消息分组为 (1 1 10 6)
"KJF" ，将消息分组为 (11 10 6)
注意，消息不能分组为  (1 11 06) ，因为 "06" 不能映射为 "F" ，这是由于 "6" 和 "06" 在映射中并不等价。

给你一个只含数字的 非空 字符串 s ，请计算并返回 解码 方法的 总数 。

题目数据保证答案肯定是一个 32 位 的整数。


    public func numDecodings(_ str: String) -> Int {
        if str.hasPrefix("0") {
            return 0;
        }
        let len = str.count
        let s = Array(str)
        var dp: [Int] = [Int](repeating: 1, count: len + 1)
        for i in 1 ..< len {
            if s[i] == "0" {
                dp[i] = 0
                if s[i - 1] == "0" || s[i - 1] > "2" {
                    return 0
                }
            }
            let num1 = s[i - 1]
            let num2 = s[i]
            if num1 > "2" || (num1 == "2" && num2 > "6") {
                dp[i - 1] = 0
            }
            dp[i + 1] = dp[i] + dp[i - 1]
        }
        return dp.last!
    }
