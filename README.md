LeetCode 91. 解码方法
https://leetcode-cn.com/problems/decode-ways/


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
