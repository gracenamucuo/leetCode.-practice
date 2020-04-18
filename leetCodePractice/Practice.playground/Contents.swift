import Cocoa
///插入排序_交换
func insertSort_swap(_ array:[Int]) -> [Int] {
    var a = array
    for x in 1 ..< a.count {
        var y = x
        while y > 0 && a[y] < a[y - 1] {
            a.swapAt(y, y-1)
            y -= 1
        }
    }
    return a
}
print(insertSort_swap([3,-1,4,8,-2,-6,9,-5,0]))

///插入排序_移动
func insetSort_shift(array:[Int])->[Int]{
    var a = array
    for x in 1 ..< a.count {
        var y = x
        let temp = a[y]
        while y > 0 && temp < a[y - 1] { // 一直用当前遍历的值去比较
               a[y] = a[y - 1]
                y -= 1
        }
        a[y] = temp
    }
    return a
}

insetSort_shift(array: [3,-1,4,8,-2,-6,9,-5,0])

///泛型
func insetSort_genericity<T:Comparable>(_ array:[T],_ comeBeforeOrder:(_:T,_:T)->Bool) -> [T]{
    var a = array
    for x in 1 ..< a.count {
        var y = x
        let temp = a[y]
        while y > 0 && comeBeforeOrder(temp,a[y - 1]) { // 一直用当前遍历的值去比较
               a[y] = a[y - 1]
                y -= 1
        }
        a[y] = temp
    }
    return a
}
print(insetSort_genericity([3,-1,4,8,-2,-6,9,-5,0], >))


func twoSum(_ array:[Int],sum:Int)->[(Int,Int)]{
    guard array.count >= 2 else {
        return []
    }
    let a = array
    var result:[(Int,Int)] = []
    
    for x in 0..<a.count {
        
        for y in (x + 1)..<a.count {
            
            if a[x] + a[y] == sum {
                result.append((a[x],a[y]))
            }
        }
    }
    return result
}

print(twoSum([0,7,2,4,7,8,9,5,1], sum: 9))

///生命游戏

//func lifeGame(_ array:[[Int]])->[Int]{
//    guard array.count > 0 else {
//        return []
//    }
//    ///寻找8个位置
//    let a = array
//    let row = a.count
//    for r in 0..<a.count {
//        let inner_arr = a[r]
//        let col = inner_arr.count
//        for c in 0..<inner_arr.count {
//            //上
//            var up:Int? = nil
//            if r - 1 >= 0 {
//                up = a[r-1][c]
//            }
//            //左上
//            var left_up:Int? = nil
//            if r - 1 >= 0 && c - 1 >= 0 {
//                left_up = a[r - 1][c - 1]
//            }
//            //左
//            var left:Int? = nil
//            if c - 1 >= 0 {
//                left = inner_arr[c - 1]
//            }
//            //左下
//            
//            //下
//            //右下
//            //右
//            //右上
//        }
//    }
//    
//    //比较三个条件
//    
//    ///标记、重建
//    return []
//}

///MARK ----螺旋矩阵
///从(0,0)开始遍历
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
    var clockwise = true
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

                endRight = (c + 1) == column
                endRight = endRight || ((c + 1) < column && flag.contains(generateCoordinate(r, c + 1)))
            }
            else if (c - 1) >= 0 && !flag.contains(generateCoordinate(r, c - 1)) {                            c -= 1
                
                endLeft = c  == 0
                endLeft =  endLeft || (c > 0 && flag.contains(generateCoordinate(r, c )))
            }
            
            ///列走到头了
            if endRight || endLeft {
                clockwise = false
            }
        }
        else{//走列
            
            var endUp = false
            var endDown = false
            if (r - 1) >= 0 && !flag.contains(generateCoordinate(r - 1, c)) {///上
                r -= 1
                
                endDown = (r - 1) == 0
                endDown = endDown || (r > 0 && flag.contains(generateCoordinate(r, c)))

            }
            else if (r + 1) < row && !flag.contains(generateCoordinate(r + 1, c)) {//下
                r += 1
                
                endUp = (r + 1) == row
                endUp = endUp || (r + 1 < row && flag.contains(generateCoordinate(r + 1, c)))
            }
            
            //下 上到头
            if endUp || endDown {
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

let matrix = [[1,3,4,6,9],[5,7,8,22,100],[10,12,15,19,200]]

print(normalSpiral(matrix))

/// MARK -- 全排列
/*
 如"abc" 输出为：”a, b, c"  "a, c, b"  "b, a, c" "b, c, a" "c, a, b" "c, b, a"   20min
 */
func fullPermutation() -> [String]{
    result []
}
