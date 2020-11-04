//
//  ViewController.swift
//  算法demo
//
//  Created by dumeng on 2020/10/19.
//  Copyright © 2020 dumeng. All rights reserved.
//

import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class ViewController: UIViewController {
    
    lazy var model = AlogorithmModel()
    let modelojc = ObjcAlogorithm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("\(smallerNumbersThanCurrent2([5,0,10,0,10,6]))")
        
        
//        let node1 = AlogorithmModel.TreeNode(1)
//        let node2 = AlogorithmModel.TreeNode(2)
//        let node3 = AlogorithmModel.TreeNode(3)
//        node2.left = node1
//        node2.right = node3
        
//        let model1 = AlogorithmModel.Solution()
//        model1.preorderTraversal(node2)
        
//        print("\(model.uniqueOccurrences([1,2,2,1,1,3]))")
        
//        print("\(model.reverseLeftWords("abcdefg", 2))")
        
//        print("\(model.baserQuickSort())")
        
//        let node1 = ListNode(1)
//        let node2 = ListNode(2)
//        let node3 = ListNode(3)
//
//        node1.next = node2
//        node2.next = node3
//
//        let pre = reverseList(node1)
//        print(pre)
        
//        print("\(validMountainArray([0,1,2,3,4,5,6,7,8,9]))")
        let list = [1,2,3,4,5, 6 , 7 , 8 ,9, 10, 11]
        dealListToTwoSubList(list: list)
    }
    
    /*/
     剑指 Offer 24. 反转链表
     定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

     示例:

     输入: 1->2->3->4->5->NULL
     输出: 5->4->3->2->1->NULL

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        var cur: ListNode? = nil
//        var pre = head
//        while pre != nil {
//            let temPre = pre?.next
//            pre?.next = cur
//            cur = pre
//            pre = temPre
//        }
//        return cur
    //    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var list: [ListNode] = []
        var header = head
        while header != nil {
            list.append(header!)
            header = header?.next
        }
        
        let res = list.last
        var tem = res
        while list.count > 0 {
            list.removeLast()
            tem?.next = list.last
            tem = tem?.next
        }
        
        return res
    }
    
    /*
     剑指 Offer 10- I. 斐波那契数列
     写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

     F(0) = 0,   F(1) = 1
     F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
     斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

     答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

      

     示例 1：

     输入：n = 2
     输出：1
     示例 2：

     输入：n = 5
     输出：5
     */
    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        
        var a = 0, b = 1, sum = 0
        for i in 0..<n {
            sum = (a + b) % 1000000007
            a = b
            b = sum
        }
        return a
    }
}

extension ViewController {
    //分割数组
    func dealListToTwoSubList<T>(list: [T]) -> [[T]] {
        
        let count = list.count/2
        let hasSingleValue = list.count%2 == 1
        
        var targetList: [[T]] = []
        for i in 0..<count {
            let firstIndex = i * 2
            let subList = Array(list[firstIndex...firstIndex+1])
            targetList.append(subList)
        }
        
        //有余数, 加上最后一个
        if hasSingleValue {
            if let lastItem = list.last {
                var subList: [T] = []
                subList.append(lastItem)
                targetList.append(subList)
            }
        }
        
        
        print("\(targetList)")
        return targetList
    }
}

