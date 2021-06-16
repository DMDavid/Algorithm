//
//  ViewController+LRU.swift
//  算法demo
//
//  Created by dumeng on 2021/6/3.
//  Copyright © 2021 dumeng. All rights reserved.
//

import UIKit

//class LRUCache: NSObject {
//    //哈希表
//    var map = [Int: Tree_node]()
//    //最大容量
//    var capacity = 0
//    //最前面node
//    var fristNode = Tree_node(0, left: nil, right: nil)
//    var lastNode = Tree_node(0, left: nil, right: nil)
//
//    init(_ capacity: Int) {
//        self.capacity = capacity
//
//        fristNode.right_node = lastNode
//        lastNode.left_node = fristNode
//    }
//
//    //获取
//    func get(_ key: Int) -> Int {
//        guard let node = map[key] else { return -1 }
//
//        //更新
//        removeNode(node: node)
//        addAtFristNode(node: node)
//
//        return node.value
//    }
//
//    //存放
//    func put(_ key: Int, _ value: Int) {
//        if let node = map[key] {
//            node.value = value
//            map[key] = node
//
//            removeNode(node: node)
//            addAtFristNode(node: node)
//        } else {
//
//            if map.keys.count == self.capacity {
//                map.removeValue(forKey: key)
//
//                //
//                removeNode(node: )
//            }
//
//            let newNode = Tree_node(value, left: fristNode, right: fristNode.right_node)
//        }
//
//    }
//
//    //双向链表‘
//    //删除
//    func removeNode(node: Tree_node) {
//        node.right_node?.left_node = node.left_node
//        node.left_node?.right_node = node.right_node
//    }
//
//    //添加到第一个
//    func addAtFristNode(node: Tree_node) {
//        node.right_node = fristNode.right_node
//        node.right_node?.left_node = node
//
//        fristNode.right_node = node
//        node.left_node = fristNode
//    }
//
//}

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
