//
//  11Month.swift
//  算法demo
//
//  Created by dumeng on 2020/11/9.
//  Copyright © 2020 dumeng. All rights reserved.
//

extension ViewController {
    /*
     973. 最接近原点的 K 个点
     我们有一个由平面上的点组成的列表 points。需要从中找出 K 个距离原点 (0, 0) 最近的点。

     （这里，平面上两点之间的距离是欧几里德距离。）

     你可以按任何顺序返回答案。除了点坐标的顺序之外，答案确保是唯一的。

      

     示例 1：

     输入：points = [[1,3],[-2,2]], K = 1
     输出：[[-2,2]]
     解释：
     (1, 3) 和原点之间的距离为 sqrt(10)，
     (-2, 2) 和原点之间的距离为 sqrt(8)，
     由于 sqrt(8) < sqrt(10)，(-2, 2) 离原点更近。
     我们只需要距离原点最近的 K = 1 个点，所以答案就是 [[-2,2]]。
     示例 2：

     输入：points = [[3,3],[5,-1],[-2,4]], K = 2
     输出：[[3,3],[-2,4]]
     （答案 [[-2,4],[3,3]] 也会被接受。）
     */
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        
        var result = points
        quickSort(data: &result, low: 0, high: result.count - 1)
        
        print("\(result)")
        
        return Array(result.prefix(K))
    }
    
    func quickSort(data:inout [[Int]],low:Int,high:Int) -> Void {
        if low > high {
            return
        }
        
        let sortIndex = partition(data: &data, low: low, high: high)

        quickSort(data: &data, low: low, high: sortIndex-1)
        quickSort(data: &data, low: sortIndex+1, high: high)
    }
    
    func partition( data: inout [[Int]], low:Int, high:Int) -> Int {
        
         let root = data[high]
         var index = low
         for i in low...high {
            
            let item1 = data[i].first! * data[i].first! + data[i].last! * data[i].last!
            let item2 = root.first! * root.first! + root.last! * root.last!
            
             if item1 < item2 {
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
}

extension ViewController {
    /*1030. 距离顺序排列矩阵单元格
     给出 R 行 C 列的矩阵，其中的单元格的整数坐标为 (r, c)，满足 0 <= r < R 且 0 <= c < C。

     另外，我们在该矩阵中给出了一个坐标为 (r0, c0) 的单元格。

     返回矩阵中的所有单元格的坐标，并按到 (r0, c0) 的距离从最小到最大的顺序排，其中，两单元格(r1, c1) 和 (r2, c2) 之间的距离是曼哈顿距离，|r1 - r2| + |c1 - c2|。（你可以按任何满足此条件的顺序返回答案。）
     示例 1：

     输入：R = 1, C = 2, r0 = 0, c0 = 0
     输出：[[0,0],[0,1]]
     解释：从 (r0, c0) 到其他单元格的距离为：[0,1]
     示例 2：

     输入：R = 2, C = 2, r0 = 0, c0 = 1
     输出：[[0,1],[0,0],[1,1],[1,0]]
     解释：从 (r0, c0) 到其他单元格的距离为：[0,1,1,2]
     [[0,1],[1,1],[0,0],[1,0]] 也会被视作正确答案。
     示例 3：

     输入：R = 2, C = 3, r0 = 1, c0 = 2
     输出：[[1,2],[0,2],[1,1],[0,1],[1,0],[0,0]]
     解释：从 (r0, c0) 到其他单元格的距离为：[0,1,1,2,2,3]
     其他满足题目要求的答案也会被视为正确，例如 [[1,2],[1,1],[0,2],[1,0],[0,1],[0,0]]。
     */
//    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
//        var list = [[Int]]()
//        for r in 0..<R {
//            for c in 0..<C {
//                list.append([r, c])
//            }
//        }
//
//        var newList = list.sorted { (item1, item2) -> Bool in
//            let one = getDistance(item: item1, r0, c0)
//            let two = getDistance(item: item2, r0, c0)
//            return one < two
//        }
//
//        print("\(newList)")
//
//        return newList
//    }
    
    //优化
    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var maps = [Int: [[Int]] ]()
        for r in 0..<R {
            for c in 0..<C {
                let distance = getDistance(item: [r, c], r0, c0)
                if let list = maps[distance] {
                    var newList = list
                    newList.append([r, c])
                    maps[distance] = newList
                } else {
                    var newList = [[Int]]()
                    newList.append([r, c])
                    maps[distance] = newList
                }
            }
        }
        
        var result = [[Int]]()
        let newKeys = maps.keys.sorted(by: { $0 < $1 })
        for item in newKeys {
            if let value = maps[item] {
                for item2 in value {
                    result.append(item2)
                }
            }
        }
        print("\(result)")
        
        return result
    }
    
    func getDistance(item: [Int], _ r0: Int, _ c0: Int) -> Int {
        return abs(item.first! - r0) + abs(item.last! - c0)
    }
}
