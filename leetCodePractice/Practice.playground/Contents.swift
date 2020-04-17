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

func lifeGame(_ array:[[Int]])->[Int]{
    guard array.count > 0 else {
        return []
    }
    ///寻找8个位置
    let a = array
    let row = a.count
    for r in 0..<a.count {
        let inner_arr = a[r]
        let col = inner_arr.count
        for c in 0..<inner_arr.count {
            //上
            var up:Int? = nil
            if r - 1 >= 0 {
                up = a[r-1][c]
            }
            //左上
            var left_up:Int? = nil
            if r - 1 >= 0 && c - 1 >= 0 {
                left_up = a[r - 1][c - 1]
            }
            //左
            var left:Int? = nil
            if c - 1 >= 0 {
                left = inner_arr[c - 1]
            }
            //左下
            
            //下
            //右下
            //右
            //右上
        }
    }
    
    //比较三个条件
    
    ///标记、重建
    return []
}

