//
//  ViewController+LRU.swift
//  算法demo
//
//  Created by dumeng on 2021/6/3.
//  Copyright © 2021 dumeng. All rights reserved.
//

import UIKit

extension ViewController {
//    class LRUCache {
//        var map : [Int: Tree_node]!
//        var capacity = 0
//        var first: Tree_node!
//        var last: Tree_node!
//
//        init(_ capacity: Int) {
//          self.capacity = capacity
//          map = [Int: Tree_node]()
//
//          first = Tree_node.init()
//          last = Tree_node.init()
//
//          first.next = last
//          last.prev = first
//        }
//
//        func get(_ key: Int) -> Int {
//          guard let node = map[key] else {
//            return -1
//          }
//
//          //! 更新
//          removeNode(node)
//          addAtFirst(node)
//          return node.val
//        }
//
//        func put(_ key: Int, _ value: Int) {
//          let node = map[key]
//          if node != nil {
//            //! 更新 key
//            node!.val = value
//            removeNode(node!)
//            addAtFirst(node!)
//
//          } else {
//
//            if map.keys.count == capacity {
//              //! 淘汰最近最少使用
//              let prevNode = map.removeValue(forKey: last.prev!.key)!
//              removeNode(prevNode)
//            }
//            let newNode = MyNode.init(key, value)
//            map[key] = newNode
//            addAtFirst(newNode)
//          }
//
//
//        }
//
//
//        //! 双向链表 -> 删除 自身
//        private func removeNode(_ node:MyNode) {
//          node.next!.prev = node.prev
//          node.prev!.next = node.next
//        }
//
//        //! 双向链表 -> 插入节点到头节点后面
//        private func addAtFirst(_ node:MyNode) {
//          node.next = first.next
//          first.next!.prev = node
//
//          first.next = node
//          node.prev = first
//        }
//    }
}
