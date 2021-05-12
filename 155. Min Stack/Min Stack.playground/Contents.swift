//Runtime: 76 ms, faster than 29.84% of Swift online submissions for Min Stack.
//Memory Usage: 15.4 MB, less than 52.13% of Swift online submissions for Min Stack.

// init()
// Time complexity: O(1)
// Space complexity: O(1)

// push()
// Time complexity: O(1)
// Space complexity: O(1)

// pop()
// Time complexity: O(1)
// Space complexity: O(1)

// top()
// Time complexity: O(1)
// Space complexity: O(1)

// getMin()
// Time complexity: O(1)
// Space complexity: O(1)

import Foundation

class MinStack {

    typealias StackElement = (value: Int, currentMin: Int)
    
    var stack: [StackElement]
    
    /** initialize your data structure here. */
    init() {
        stack = [StackElement]()
    }
    
    func push(_ val: Int) {
        if stack.last != nil && val > stack.last!.currentMin {
            stack.append(StackElement(val, stack.last!.currentMin))
        } else {
            stack.append(StackElement(val, val))
        }
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        return stack.last!.value
    }
    
    func getMin() -> Int {
        return stack.last!.currentMin
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

let minStack = MinStack()
//minStack.push(-2)
//minStack.push(0)
//minStack.push(-3)
//minStack.getMin() // return -3
//minStack.pop()
//minStack.top()    // return 0
//minStack.getMin() // return -2

minStack.push(-10)
minStack.push(14)
minStack.getMin()
minStack.getMin()
minStack.push(-20)
minStack.getMin()
minStack.getMin()
minStack.top()
minStack.getMin()
minStack.pop()
minStack.push(10)
minStack.push(-7)
minStack.getMin() // -10
minStack.push(7)
minStack.pop()
minStack.top() // -7
minStack.getMin() // -10
minStack.pop()
