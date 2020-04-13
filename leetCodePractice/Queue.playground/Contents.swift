import Cocoa
///MARK---用数组实现队列
///向数组中拼接元素是O(1)，因为swift的数组总是有预留空间。但是如果将预留空间用完的话，需要扩容的时候，是O(n),但是总体均摊下来依然是O(1)。
///出队，从头出队，是O(n)因为所有后边的元素，都需要往前移动一位。

///实现出队为O(1)操作的队列  将头部的位置预留处理，每次出队的时候，后边元素不进行往前移动，之后定期移动一次、
public struct Queue<T>{
   fileprivate var array = [T?]()
   fileprivate var head = 0
   
    var isEmpty:Bool{
        return count == 0
    }
    
    var count:Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element:T){
        array.append(element)
    }
    
   public mutating func dequeue()->T?{
    guard head < array.count,let element = array[head] else {
        return nil
    }
    array[head] = nil
    head += 1
    
    let percentage = Double(head)/Double(array.count)
    ///定时移动 节省空间
    if array.count > 50 && percentage > 0.25 {
        array.removeFirst(head)
        head = 0
    }
    
    return element
    
    }
    
    public var front:T? {
        if isEmpty {
            return nil
        }else{
            return array[head]
        }
    }

}

extension Array{
    subscript(guarded idx:Int)->Element?{
        guard(startIndex..<endIndex).contains(idx) else{
            return nil
        }
        return self[idx]
    }
}



var q = Queue<String>()
q.array

q.enqueue("a")
q.enqueue("b")
q.enqueue("c")

q.array
q.count

q.dequeue()
q.array
q.count

q.dequeue()
q.array
q.count
