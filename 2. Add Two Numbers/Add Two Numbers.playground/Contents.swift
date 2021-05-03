//Runtime Error
//process exited with signal SIGILL

// Time complexity: O(N+M)
// Space complexity: O(1)

import Foundation

let solution = Solution()

//let node1 = ListNodeUtil.create([2,4,3])
//let node2 = ListNodeUtil.create([5,6,4])
let node1 = ListNodeUtil.create([9,9,9,9,9,9,9])
let node2 = ListNodeUtil.create([9,9,9,9])

let node3 = solution.addTwoNumbers(node1, node2)
ListNodeUtil.printNodes(node3)

class ListNodeUtil {
    static func create(_ array: [Int]) -> ListNode? {
        var node: ListNode? = nil
        for e in array.reversed() {
            node = ListNode(e, node)
        }
        
        return node
    }
    
    static func printNodes(_ head: ListNode?) {
        print(head?.val)
        if let next = head?.next {
            printNodes(next)
        }
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node = l1
        var val1 = 0
        var digit = 1
        while node != nil {
            val1 += digit * node!.val
            digit *= 10
            node = node!.next
        }
        
        node = l2
        var val2 = 0
        digit = 1
        while node != nil {
            val2 += digit * node!.val
            digit *= 10
            node = node!.next
        }

        var sum = val1 + val2

        let firstNode: ListNode! = val1 > val2 ? l1 : l2
        firstNode.val = sum % 10
        node = firstNode
        sum /= 10
        
        while sum > 0 {
            if node!.next == nil {
                node!.next = ListNode(sum % 10)
            } else {
                node!.next!.val = sum % 10
            }
            
            node = node!.next
            sum /= 10
        }
        
        return firstNode
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
