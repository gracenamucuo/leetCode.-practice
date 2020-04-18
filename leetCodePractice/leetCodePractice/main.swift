//
//  main.swift
//  leetCodePractice
//
//  Created by 戴运鹏 on 2019/3/9.
//  Copyright © 2019 戴运鹏. All rights reserved.
//

import Foundation

func insertSort2(_ array:[Int])->[Int]{
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]///将要比较的值记下
        
        while y > 0 && temp < a[y - 1] {
            a[y] = a[y - 1]// 赋值相当于移位置 要比较的值已经记下来了。
            y -= 1
        }
        a[y] = temp ///找到要比较值的位置
    }
    return a
}

let searchTree = createBinarySearchTree()
//print(searchValue(value: 9, in: searchTree)?.val)

let tree = insertValue(value: 10, in: searchTree)

//print("-------------------")
//print(insertSort2([ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]))


func normalSpiral(_ array:[[Int]])->[Int]{
    guard array.count > 0 else {
        return []
    }

    ///行
    let row = array.count
    ///列
    let column = array.first!.count
    
    var result:[Int] = Array()
    var flag:[String] = Array()
    
    func generateCoordinate(_ x:Int,_ y:Int)-> String{
        return String(x) + "_" + String(y)
    }
    
    var r = 0
    var c = 0
    ///顺时针走
    var clockwise = false
    while (r < row && r >= 0) && (c < column && c >= 0) && result.count <= row * column {
        if !flag.contains(generateCoordinate(r, c)) {
            result.append(array[r][c])
            flag.append(generateCoordinate(r, c))
        }
        
        if clockwise {///走行
            var endRight = false
            var endLeft = false
            if (c + 1) < column && !flag.contains(generateCoordinate(r, c + 1)) {
                c += 1

//                endRight = (c + 1) == column
//                endRight = endRight || ((c + 1) < column && flag.contains(generateCoordinate(r, c + 1)))
            }
            else if (c - 1) >= 0 && !flag.contains(generateCoordinate(r, c - 1)) {                            c -= 1
                
//                endLeft = c  == 0
//                endLeft =  endLeft || (c > 0 && flag.contains(generateCoordinate(r, c )))
            }else{
                clockwise = false
            }
            
            ///列走到头了
//            if endRight || endLeft {
//                clockwise = false
//            }
        }
        else{//走列
            
//            var endUp = false
//            var endDown = false
            if (r - 1) >= 0 && !flag.contains(generateCoordinate(r - 1, c)) {///上
                r -= 1
                
//                endDown = r == 0
//                endDown = endDown || (r > 0 && flag.contains(generateCoordinate(r, c)))

            }
            else if (r + 1) < row && !flag.contains(generateCoordinate(r + 1, c)) {//下
                r += 1
                
//                endUp = (r + 1) == row
//                endUp = endUp || (r + 1 < row && flag.contains(generateCoordinate(r + 1, c)))
            }else{
                clockwise = true
            }
            
//            //下 上到头
//            if endUp || endDown {
//                clockwise = true
//            }
        }
        
        ///跳出循环
        if result.count == row * column {
            r = -1
        }
    }
    
    return result
}

//let matrix = [[1,3,4,6,9],[5,7,8,22,100],[10,12,15,19,200],[11,111,112,113,114]]
let matrix = [[1,3,4],[5,7,8],[10,12,15],[11,111,112]]

print(normalSpiral(matrix))
