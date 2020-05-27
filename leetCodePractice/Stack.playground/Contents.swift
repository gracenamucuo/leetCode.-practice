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

//var stack: Stack<Int> = Stack<Any>()
//stack.push(1)
//stack.push("124")
//stack.push(2)

extension Stack:Sequence{
    public func makeIterator() -> AnyIterator<T> {
        var current = self
        return AnyIterator {
            return current.pop()
        }
    }
}

var s0 = Stack<Int>()

  s0.push(1)
  s0.push(2)
  s0.push(3)
  s0.push(4)
  s0.push(5)
  print(s0)

  func stackReverse(stack:inout Stack<Int>){
      if stack.isEmpty {
          return
      }
      let temp = removeTail(stack: &stack)
        print(String(temp) + "temp")
      stackReverse(stack: &stack)
      stack.push(temp)
  }

  func removeTail(stack:inout Stack<Int>) -> Int{
      let result = stack.pop()
      if stack.isEmpty {
        return result!
      }
      let tail = removeTail(stack: &stack)
      stack.push(result!)
      print(String(tail) + "tail")
      return tail
  }

  stackReverse(stack: &s0)
  print(s0)


