//
//  ViewController+Extension2.swift
//  算法demo
//
//  Created by dumeng on 2020/11/4.
//  Copyright © 2020 dumeng. All rights reserved.
//



extension ViewController {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        guard candies.count > 0 else { return [] }
        
        var maxItem = 0
        for item in candies {
            maxItem = maxItem > item ? maxItem : item
        }
        
        var list: [Bool] = []
        for item2 in candies {
            var newItem = extraCandies + item2
            if newItem >= maxItem {
                list.append(true)
            } else {
                list.append(false)
            }
        }
        
        return list
    }
}


extension ViewController {
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // 处理 list
        if !wordList.contains(endWord){
            return 0
        }

        let dict = Set(wordList)
        var beginSet = Set<String>()
        var endSet = Set<String>()
        var visitedSet = Set<String>()
        var length = 1
        var found = false
        
        beginSet.insert(beginWord)
        endSet.insert(endWord)
        
        while !found && !beginSet.isEmpty && !endSet.isEmpty {
            var nextSet = Set<String>()
            //accelerating search speed by swap begin and end
            //通过交换开始和结束来加快搜索速度
            if beginSet.count > endSet.count {
                swap(&beginSet, &endSet)
            }
            found = helper(beginSet, endSet, dict, &visitedSet, &nextSet)
            beginSet = nextSet
            length += 1
        }
        
        
        return found ? length : 0
    }
    
    private func helper(_ beginSet: Set<String>, _ endSet: Set<String>, _ dict: Set<String>,
                        _ visitedSet: inout Set<String>, _ resSet: inout Set<String>) -> Bool {
        
        let alphaArray = Array("abcdefghijklmnopqrstuvwxyz")
        
        for word in beginSet {
            for i in 0 ..< word.count {
                var chars = Array(word)
                
                
                for j in 0 ..< alphaArray.count{
                    chars[i] = alphaArray[j]
                    let str = String(chars)
                    
                    print("\(str)")
                    
                    if dict.contains(str) {
                        if endSet.contains(str)
                        {
                            return true
                        }
                        if !visitedSet.contains(str)
                        {
                            resSet.insert(str)
                            visitedSet.insert(str)
                        }
                    }
                }
            }
        }
        return false
    }
}
