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
//
//        let node1 = ListNode(1)
//        let node2 = ListNode(2)
//        let node3 = ListNode(3)
//        let node4 = ListNode(4)
//        let node5 = ListNode(5)
//
//        node1.next = node2
//        node2.next = node3
//        node3.next = node4
//        node4.next = node5
        
//        let node1 = ListNode(1)
//        let node2 = ListNode(2)
//        let node3 = ListNode(4)
//        node1.next = node2
//        node2.next = node3
//
//
//        let snode1 = ListNode(1)
//        let snode2 = ListNode(2)
//        let snode3 = ListNode(3)
//        snode1.next = snode2
//        snode2.next = snode3
//
//        let result = mergeTwoLists(node1, snode1)
//        print("\(result)")
        
        
//        let tree = Tree()
//        let new = tree.serialization(list: [62,58,88,47,73,99,35,51,93,29,37,49,56,36,48,50])
//        print("\(new)")
        
//        let ss = fanZhuanLianBiao(head: snode1)
        
//        var list: [Character] = ["a", "b", "c"]
//        reverseString(&list)
//        print("\(list)")
        
//        var num1 = [1,2,3,0,0,0]
//        var num2 = [2,5,6]
//        merge(&num1, 3, num2, 3)
        
//        findMedianSortedArrays([1, 2], [3, 4])
        
//        var l1 = ListNode(1)
//        l1.next = ListNode(2)
//        l1.next?.next = ListNode(4)
//        print("\(search([1,2,2,3,4],2))")
        
        print("\(largestNumber([3,30,34,5,9]))")
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


extension ViewController {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }

        if l1?.val ?? 0 <= l2?.val ?? 0 {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    
//    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        if l1 == nil { return l2 }
//        if l2 == nil { return l1 }
//
//        var k1 = l1
//        var k2 = l2
//
//        //找到头结点
//        var header: ListNode? = nil
//        if k1?.val ?? 0 <= k2?.val ?? 0 {
//            header = k1
//            k1 = k1?.next
//        } else {
//            header = k2
//            k2 = k2?.next
//        }
//
//        //逐个比较
//        var cur = header
//        while(k1 != nil && k2 != nil) {
//            if k1!.val <= k2!.val {
//                cur?.next = k1
//                cur = cur?.next
//                k1 = k1?.next
//            } else {
//                cur?.next = k2
//                cur = cur?.next
//                k2 = k2?.next
//            }
//        }
//
//        if k1 == nil {
//            cur?.next = k2
//        } else if k2 == nil {
//            cur?.next = k1
//        }
//
//        return header
//    }
}
