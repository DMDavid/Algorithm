//
//  Lianbiao.swift
//  算法demo
//
//  Created by dumeng on 2020/11/17.
//  Copyright © 2020 dumeng. All rights reserved.
//

extension ViewController {
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k == nums.count else {
            return
        }
        
        reverse(&nums, start: 0, end: nums.count - 1)
        guard k < nums.count else {
            return
        }
        reverse(&nums, start: 0, end: (k - 1) < 0 ? 0 : k - 1)
        reverse(&nums, start: k, end: nums.count - 1)
    }
    
    func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var tStart = start;
        var tEnd = end;
        while tStart < tEnd {
            var tem = nums[tStart]
            nums[tStart] = nums[tEnd]
            nums[tEnd] = tem
            
            tStart += 1
            tEnd -= 1
        }
    }
}

extension ViewController {
    /*
     获取倒数第k个元素
     链表
     
     
     ListNode *p = head, *q = head; //初始化
     while(k--) {   //将 p指针移动 k 次
     p = p->next;
     }
     while(p != nullptr) {//同时移动，直到 p == nullptr
     p = p->next;
     q = q->next;
     }
     return q;
     
     */
    func getKthFromEnd(head: ListNode, k: Int) -> ListNode? {
        var p: ListNode? = head
        var q: ListNode? = head
        var newK = k
        while (newK != 0) {
            if let result = p?.next {
                p = result
                newK -= 1
            } else {
                return nil
            }
        }
        
        while p != nil {
            p = p?.next
            q = q?.next
        }
        
        return q
    }
}


extension ViewController {
    /*
     获取中间位置的元素
     链表
     
     
     class Solution {
     public:
         ListNode* middleNode(ListNode* head) {
             ListNode *p = head, *q = head;
             while(q != nullptr && q->next != nullptr) {
                 p = p->next;
                 q = q->next->next;
             }
             return p;
         }
     };
     */
    func middleNode(head: ListNode) -> ListNode? {
        var p: ListNode? = head
        var q: ListNode? = head
        while q != nil, q?.next != nil {
            p = p?.next
            q = q?.next?.next
        }
        
        return p
    }
}

extension ViewController {
    /*
     判断链表是否🈶环
     链表
     
     class Solution {
     public:
         bool hasCycle(ListNode *head) {
             ListNode *slow = head;
             ListNode *fast = head;
             while(fast != nullptr) {
                 fast = fast->next;
                 if(fast != nullptr) {
                     fast = fast->next;
                 }
                 if(fast == slow) {
                     return true;
                 }
                 slow = slow->next;
             }
             return nullptr;
         }
     };
     */
    func hasCycle(head: ListNode) -> Bool {
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast != nil {
            guard let item = fast?.next?.next else { return false }
            fast = item
            if fast?.val == slow?.val {
                return true
            }
            
            slow = slow?.next
        }
        return false
    }
}

extension ViewController {
    /*
     相交链表
     */
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var currentA = headA
        var currentB = headB
        //！ 等价于 同一对象
        while currentA !== currentB {
            currentA = (currentA != nil) ? currentA?.next : headB
            currentB = (currentB != nil) ? currentB?.next : headA
        }
        return currentA
    }
}

extension ViewController {
    /*
     合并两个有序链表
     
     示例：

     输入：1->2->4, 1->3->4
     输出：1->1->2->3->4->4
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        
        if l1?.val ?? 0 < l2?.val ?? 0 {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
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
    
    //1. 放入数组，然后比较
    
    //2. 快慢指针，平分，
    // 翻转后面的链表，然后比较 **
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
    

//    //! 双向链表 -> 删除 自身
//    func removeOneNode(_ node: Tree_node) {
//      node.next!.prev = node.prev
//      node.prev!.next = node.next
//    }
    
}

extension ViewController {
    /*
     19. 删除链表的倒数第 N 个结点
     输入：head = [1,2,3,4,5], n = 2
     输出：[1,2,3,5]
     示例 2：

     输入：head = [1], n = 1
     输出：[]
     */
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        
        var fastNode: ListNode? = dummy
        var slowNode: ListNode? = dummy
        
        for _ in 0..<n {
            fastNode = fastNode?.next
        }
        
        while fastNode?.next != nil {
            fastNode = fastNode?.next
            slowNode = slowNode?.next
        }
        
        slowNode?.next = slowNode?.next?.next
        
        let node = dummy?.next
        
        return node
    }
}


