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
            if (c + 1) < column && !flag.contains(generateCoordinate(r, c + 1)) {
                c += 1
            }else if (c - 1) >= 0 && !flag.contains(generateCoordinate(r, c - 1)) {                            c -= 1
                
            }else{
                clockwise = false
            }

        }
        else{//走列
            if (r - 1) >= 0 && !flag.contains(generateCoordinate(r - 1, c)) {///上
                r -= 1
            }
            else if (r + 1) < row && !flag.contains(generateCoordinate(r + 1, c)) {//下
                r += 1
            }else{
                clockwise = true
            }
        }
        
        ///跳出循环
        if result.count == row * column {
            r = -1
        }
    }
    
    return result
}

let matrix = [[1,3,4,6,9],[5,7,8,22,100],[10,12,15,19,200],[11,111,112,113,114]]
//let matrix = [[1,3,4],[5,7,8],[10,12,15],[11,111,112]]

//print(normalSpiral(matrix))


func spiral(_ array:[[Int]],_ beginPoint:(Int,Int)) -> [Int] {
    guard array.count > 0 else {
        return []
    }
    
    var row = array.count
    var column = array.first!.count
    guard beginPoint.0 < row && beginPoint.1 < column else {
        return []
    }
    let a = array
    var result:[Int] = Array()
    
    let r = beginPoint.0
    let c = beginPoint.1
    
    ///加入第一个
    result.append(a[r][c])
    var step = 1
    let original = (r,c)
    while result.count <= a.count {
        around(&result, original, step, a)
        step += 1
    }
    return result
    
}

func around(_ result:inout [Int], _ original:(Int,Int),_ step:Int,_ array:[[Int]]){
    /*
     ///顺时针
     
     *   *   *
     *   •   *
     *   *   *
     

     */
    
    let row = array.count
    let column = array.first!.count
    
    func tempAdd(_ turple:(Int,Int)){
        if (turple.0 < row && turple.0 >= 0) && (turple.1 < column && turple.1 >= 0) {
            result.append(array[turple.0][turple.1])
        }
    }
    
    let x = original.0
    let y = original.1
    ///在初始位置的基础上
    //右边 （x + step,y）
    var tempTurple = (x: x + step, y: y)
    tempAdd(tempTurple)
        
    //右下 (x + step,y - step)
    tempTurple = (x:x+step,y-step)
    tempAdd(tempTurple)
    
    //下 （x,y- step）
    tempTurple = (x:x,y-step)
    tempAdd(tempTurple)
    
    //左下 (x-step,y-step)
    tempTurple = (x:x - step,y:y - step)
    tempAdd(tempTurple)
    
    //左 (x-step,y)
    tempTurple = (x:x-step,y:y)
    tempAdd(tempTurple)
    
    //左上 (x-step,y+step)
    tempTurple = (x-step,y+step)
    tempAdd(tempTurple)
    
    //上(x,y+step)
    tempTurple = (x,y + step)
    tempAdd(tempTurple)
    
    //右上(x+step,y+step)
    tempTurple = (x + step,y + step)
    tempAdd(tempTurple)
}

print("========周围八个点=========")

print(spiral([[1,3,7],[2,4,6],[8,9,5]], (0,2)))

print("========周围八个点=========")
