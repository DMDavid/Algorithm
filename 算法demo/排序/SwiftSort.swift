//
//  SwiftSort.swift
//  算法demo
//
//  Created by dumeng01 on 2022/5/30.
//  Copyright © 2022 dumeng. All rights reserved.
//

import Foundation


extension ViewController {
    //快速排序
    func quickSort(_ list: inout [Int]) {
        guard list.count > 0 else { return }
        
        //找到基准点
        var fontList = [Int]()
        var behindList = [Int]()
        
        let firstPointNum = list.first!
        for i in 0..<list.count {
            if i == 0 {
                continue
            }
            
            let targetNum = list[i]
            if targetNum < firstPointNum {
                //交换
                fontList.append(targetNum)
            } else {
                behindList.append(targetNum)
            }
        }
        
        quickSort(&fontList)
        quickSort(&behindList)
        
        var result = [Int]()
        result.append(contentsOf: fontList)
        result.append(firstPointNum)
        result.append(contentsOf: behindList)
        list = result
    }
}

extension ViewController {
    //冒泡
    func maopao(_ list: inout [Int]) {
        for i in 0..<list.count-1 {
            for j in 0..<list.count-1-i {
                if list[j] > list[j+1] {
                    let tem = list[j]
                    list[j] = list[j+1]
                    list[j+1] = tem
                }
            }
        }
    }
}

extension ViewController {
    //选择
    func xuanze1(_ list: inout [Int]) {
        for i in 0..<list.count-1 {
            for j in (i + 1)..<list.count {
                if list[i] > list[j] {
                    let tem = list[i]
                    list[i] = list[j]
                    list[j] = tem
                }
            }
        }
    }
}
