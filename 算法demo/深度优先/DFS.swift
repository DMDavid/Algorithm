//
//  DFS.swift
//  算法demo
//
//  Created by dumeng01 on 2022/6/6.
//  Copyright © 2022 dumeng. All rights reserved.
//

import Foundation

extension ViewController {
    /*
     给定一个 row x col 的二维网格地图 grid ，其中：grid[i][j] = 1 表示陆地， grid[i][j] = 0 表示水域。

     网格中的格子 水平和垂直 方向相连（对角线方向不相连）。整个网格被水完全包围，但其中恰好有一个岛屿（或者说，一个或多个表示陆地的格子相连组成的岛屿）。

     岛屿中没有“湖”（“湖” 指水域在岛屿内部且不和岛屿周围的水相连）。格子是边长为 1 的正方形。网格为长方形，且宽度和高度均不超过 100 。计算这个岛屿的周长。

     来源：力扣（LeetCode）
     链接：https://leetcode.cn/problems/island-perimeter
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     
     输入：grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
     输出：16
     解释：它的周长是上面图片中的 16 个黄色的边
     
     0 1 0 0
     1 1 1 0
     0 1 0 0
     1 1 0 0
     
     */
    func islandPerimeter1(_ grid: [[Int]]) -> Int {
        var land = 0    // 土地个数
        var border = 0  // 接壤边界的条数
        
        for j in 0..<grid.count { // 第j行
            for i in 0..<grid[0].count { // 第i列
                if (grid[j][i] == 1) {
                    land = land + 1

                    // 计算右边的边界接壤的个数
                    if i < grid[0].count - 1, grid[j][i + 1] == 1 {
                        border = border + 1
                    }

                    // 计算下边的边界接壤的个数
//                    if j + 1 < grid.count, j < grid.count - 1, grid[j + 1][i] == 1 {
                    if j < grid.count - 1, grid[j + 1][i] == 1 {
                        border = border + 1
                    }
                }
            }
        }

        // 每个岛屿边长为4，两个岛屿相交，则两则总边长减2
        return 4 * land - 2 * border;
    }
}

extension ViewController {
    /*
     200. 岛屿数量
     给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

     岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

     此外，你可以假设该网格的四条边均被水包围。

     示例 1：
     输入：grid = [
       ["1","1","1","1","0"],
       ["1","1","0","1","0"],
       ["1","1","0","0","0"],
       ["0","0","0","0","0"]
     ]
     输出：1
     
     示例 2：
     输入：grid = [
       ["1","1","0","0","0"],
       ["1","1","0","0","0"],
       ["0","0","1","0","0"],
       ["0","0","0","1","1"]
     ]
     输出：3

     来源：力扣（LeetCode）
     链接：https://leetcode.cn/problems/number-of-islands
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func numIslands(_ grid: [[Character]]) -> Int {
        var newGrid = grid
        var land = 0 //岛屿个数
        
        for j in 0..<newGrid.count { //第j行
            for i in 0..<newGrid[0].count {  //第i列
                
                if newGrid[j][i] == "1" { //是岛屿一块
                    dfsIsLands(&newGrid, i, j)
                    
                    land += 1
                }
            }
        }
        return land
    }
    
    func dfsIsLands(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        guard 0 <= i, i < grid[0].count else {
            return
        }
        

        guard 0 <= j, j < grid.count else {
            return
        }
        
        guard grid[j][i] == "1"  else { return }
        
        //标记下遍历过了
        grid[j][i] = "0"
        
        //判断四周是否有岛屿
        dfsIsLands(&grid, i - 1, j)
        dfsIsLands(&grid, i + 1, j)
        dfsIsLands(&grid, i, j - 1)
        dfsIsLands(&grid, i, j + 1)
    }
}

extension ViewController {
    func permutation(_ S: String) -> [String] {
        let charList = Array(S)
        var visitedList: [Bool] = Array(repeating: false, count: charList.count)
        var result: [String] = []
        var str = ""
        dfs(&str, charList, &result, &visitedList)
        return result
    }

    func dfs(_ path: inout String, _ charList: [Character], _ result: inout [String], _ visitedList: inout [Bool]) {
        if path.count == charList.count {
            result.append(path)
            return
        }

        for (index, item) in charList.enumerated() {
            if visitedList[index] {
                continue
            }
            
            visitedList[index] = true
            path = path + String(item)
            dfs(&path, charList, &result, &visitedList)
            visitedList[index] = false
            path.remove(at: String.Index.init(encodedOffset: path.count - 1))
        }
    }
}

extension ViewController {
//    func restoreIpAddresses(_ s: String) -> [String] {
//
//    }
}
