import Foundation

let stack = Stack()
stack.push(3)
stack.push(7)
print(stack.top!)
stack.push(9)
print(stack.length)
print(stack.pop()!)
print(stack.length)

class Stack {
    var stack = [Int]()
    
    func push(_ value: Int) {
        stack.append(value)
    }
    
    func pop() -> Int? {
        return stack.popLast()
    }
    
    var top: Int? {
        return stack.last
    }
    
    var length: Int {
        return stack.count
    }
}
