//
//  Lianbiao.swift
//  算法demo
//
//  Created by dumeng on 2020/11/17.
//  Copyright © 2020 dumeng. All rights reserved.
//

extension ViewController {
    /*
     反转链表
     */
    func fanZhuanLianBiao(head: ListNode) -> ListNode? {
        var cur: ListNode? = nil
        var pre: ListNode? = head
        while pre != nil {
            let targetNextNode = pre?.next
            
            pre?.next = cur
            cur = pre
            pre = targetNextNode
        }
        
        return cur
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
