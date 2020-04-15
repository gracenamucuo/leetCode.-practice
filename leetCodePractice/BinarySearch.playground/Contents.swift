import Cocoa
///MARK---二分查找  时间复杂度log(n)
/*
1）数组是排序的
2）每次指定查找区间的时候需要进行一下比较区间右边要大于左边
3)求中间索引的时候，向下取整(32位机器上，求中间索引的时候，可能会溢出)
 
 
 */

///递归版本

func binarySearch<T:Comparable>(_ a:[T],key:T,range:Range<Int>)->Int?{
    if range.lowerBound >= range.upperBound {
        return nil
    }else{
        let minIdx = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if a[minIdx] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< minIdx)
            
        }else if a[minIdx] < key{
            return binarySearch(a, key: key, range: minIdx + 1 ..< range.upperBound)
            
        }else{
            return minIdx
        }
    }
    
}
///注意的是 Swift 的Range类的上边界是比数组多出一位

///迭代遍历版本
func binarySearch_Iterative<T:Comparable>(_ a:[T],key:T)->Int?{
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let minIdx = lowerBound + (upperBound - lowerBound) / 2
        if a[minIdx] == key {
            return minIdx
            
        }else if a[minIdx] < key{
            lowerBound = minIdx + 1
            
        }else{
            upperBound = minIdx
            
        }
    }
    return nil
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
binarySearch(numbers, key: 43, range: 0..<numbers.count)
binarySearch_Iterative(numbers, key: 13)

