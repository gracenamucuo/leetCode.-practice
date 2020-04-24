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
    
    let row = array.count
    let column = array.first!.count
    guard beginPoint.0 < row && beginPoint.1 < column else {
        return []
    }
    let a = array
    var totalArray:[(Int,Int)] = Array()
    
    let r = beginPoint.0
    let c = beginPoint.1
    
    ///加入第一个
    var step = 1
    totalArray.append(beginPoint)
    
    var result:[Int] = Array()
    result.append(a[r][c])
    while result.count < row * column {
        let t = everyStep(step, a, &totalArray)
        for (r,c) in t {
            if (r >= 0 && r < row) && (c >= 0 && c < column){
                result.append(a[r][c])
            }
        }
        step += 1
    }
    return result
    
}

func everyStep(_ step:Int,_ array:[[Int]],_ total:inout [(Int,Int)])->[(Int,Int)]{
    
    guard total.count > 0 else {
        return []
    }
    
    var result:[(Int,Int)] = Array()
    
    var last = total.last!
    
    
    if step % 2 == 0 {//偶数 先左后上
        for i in 1...step {
            ///左边走
            let r = last.0
            let c = last.1  - i
            result.append((r,c))
        }
        
        last = result.last!
        
        for i in 1...step {
            let r = last.0 - i
            let c = last.1
            result.append((r,c))
            
        }
        
    }else{///奇数 先右后下
     
        for i in 1...step {
            ///右边走
            let r = last.0
            let c = last.1 + i
            result.append((r,c))
        }
        
        last = result.last!
        
        //下
        for i in 1...step {
            let r = last.0 + i
            let c = last.1
            result.append((r,c))
            
        }
    }
    
    total.append(contentsOf: result)
    return result
    
}


print("========周围八个点=========")

print(spiral([[1,3,7,5]], (0,1)))

print("========周围八个点=========")
