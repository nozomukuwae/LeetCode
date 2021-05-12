//Runtime: 4216 ms, faster than 7.87% of Swift online submissions for Min Stack.
//Memory Usage: 15.2 MB, less than 86.56% of Swift online submissions for Min Stack.

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
// Time complexity: O(n)
// Space complexity: O(1)

import Foundation

class MinStack {

    var stack: [Int]
    
    /** initialize your data structure here. */
    init() {
        stack = [Int]()
    }
    
    func push(_ val: Int) {
        stack.append(val)
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return stack.min()!
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
minStack.push(-2)
minStack.push(0)
minStack.push(-3)
minStack.getMin() // return -3
minStack.pop()
minStack.top()    // return 0
minStack.getMin() // return -2
