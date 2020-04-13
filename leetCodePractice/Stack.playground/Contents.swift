import Cocoa

public struct Stack<T>{
    fileprivate var array = [T]()
    
    public var isEmpty:Bool {
        return array.isEmpty
    }
    
    public var count:Int {
        return array.count
    }
    
    public mutating func push(_ element:T){
        array.append(element)
    }
    
    public mutating func pop()->T?{
        array.popLast()
    }
    
    public var top:T?{
        return array.last
    }

}

var stack = Stack<Any>()
stack.push(1)
stack.push("124")
stack.push(2)
print(stack)

extension Stack:Sequence{
    public func makeIterator() -> AnyIterator<T> {
        var current = self
        return AnyIterator {
            return current.pop()
        }
    }
}


