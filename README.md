LeetCode 91. 解码方法
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