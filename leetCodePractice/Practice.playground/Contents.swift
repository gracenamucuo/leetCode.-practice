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


func towSum(_ array:[Int],sum:Int)->[(Int,Int)]{
    guard array.count > 0 else {
        return []
    }
    let a = array
    var result:[(Int,Int)] = []
    
    for value in 1..<a.count {
        
    }
    
    return []
}
