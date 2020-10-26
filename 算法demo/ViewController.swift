//
//  ViewController.swift
//  算法demo
//
//  Created by dumeng on 2020/10/19.
//  Copyright © 2020 dumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
//        print("\(isUnique("abc"))")
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
}



extension ViewController {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    
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
