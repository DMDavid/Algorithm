//
//  AlogorithmModel+Base.swift
//  算法demo
//
//  Created by dumeng on 2020/10/28.
//  Copyright © 2020 dumeng. All rights reserved.
//

extension AlogorithmModel {
    //快速排序
    func baserQuickSort() {
        var list = [47, 29, 71, 99, 78, 19, 24, 48]
        
//        quickSort(data: &list, low: 0, high: list.count - 1)
        
//        maopao(arr: &list)
        
//        xuanze(arr: &list)
        
        charu(arr: &list)
        
        print("\(list)")
    }
}

extension AlogorithmModel {
    func charu(arr: inout [Int]) {
        for i in 1..<arr.endIndex {
            let temp = arr[i]
            for j in (0..<i).reversed() {
                if arr[j] > temp {
                    arr.swapAt(j, j+1)
                }
            }
        }
    }
}

extension AlogorithmModel {
    func xuanze(arr: inout [Int]) {
        for i in 0..<(arr.count - 1) {
            var mostMiniNum = i
            
            for j in 1..<(arr.count) {
                if arr[mostMiniNum] > arr[j] {
                    mostMiniNum = j
                }
            }
            
            arr.swapAt(i, mostMiniNum)
        }
    }
}

extension AlogorithmModel {
    func maopao(arr: inout [Int]) {
        for i in 0..<(arr.count - 1) {
            
            for j in 0..<(arr.count - 1 - i) {
                if arr[j] > arr[j + 1] {
                    arr.swapAt(j, j+1)
                }
            }
            print("执行中；；；\(arr)")
        }
    }
}

extension AlogorithmModel {
    func partition( data: inout [Int],low:Int,high:Int) -> Int {
         
         let root = data[high]
         var index = low
         for i in low...high {
             if data[i] < root {
                 if i != index {
                    data.swapAt(i, index)
                 }
                 index = index+1
             }
         }
         
         if high != index {
            data.swapAt(high, index)
         }
         return index
     }
     
     func quickSort(data:inout [Int],low:Int,high:Int) -> Void {
         if low > high {
             return
         }
         let sortIndex = partition(data: &data, low: low, high: high)
         quickSort(data: &data, low: low, high: sortIndex-1)
         quickSort(data: &data, low: sortIndex+1, high: high)
        
        print("\(data)")
     }
}
