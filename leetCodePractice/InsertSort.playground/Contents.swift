import Cocoa

///插入排序的思路
/*
 1：用数组中的第一个数作为起始值
 2:将该值插入到新的数组中，从原数组中依次拿后续的元素，一直和新的数组比较，找到合适的位置插入。
 优化1:可以不用新的数组，在原有的数组上进行元素交换
 优化2:不进行交换，而是直接移动，替换
 */

///优化1
func insertSort(_ array:[Int])->[Int]{
    var a = array
    for x in 1..<a.count {//从1开始
        var y = x
        while y > 0 && a[y] < a[y-1] {
            a.swapAt(y-1, y)///交换两个值
            y-=1
        }
        
    }
    return a
    
}

///优化2
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

//泛型
func insertSort<T>(_ array:[T],_ isOrderedBefore:(T,T)->Bool)->[T]{
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp,a[y - 1]) {
         a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

let numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
print(insertSort(numbers))
print(insertSort2(numbers))
print(insertSort(numbers, <))
print(insertSort(numbers, >))

///插入排序是稳定的，值相同的两个元素排序后，不会变动原有位置。
