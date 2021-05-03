//Runtime: 36 ms, faster than 98.43% of Swift online submissions for Add Two Numbers.
//Memory Usage: 14 MB, less than 58.54% of Swift online submissions for Add Two Numbers.

// Time complexity: O(N) where N = max(l1.length, l2.length)
// Space complexity: O(N)

import Foundation

let solution = Solution()

//let node1 = ListNodeUtil.create([2,4,3])
//let node2 = ListNodeUtil.create([5,6,4])
//let node1 = ListNodeUtil.create([9,9,9,9,9,9,9])
//let node2 = ListNodeUtil.create([9,9,9,9])
let node1 = ListNodeUtil.create([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
let node2 = ListNodeUtil.create([5,6,4])

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
        var sum = l1!.val + l2!.val
        let firstNode = ListNode(sum % 10)
        sum /= 10
        var prevNode = firstNode
        var node1 = l1!.next
        var node2 = l2!.next

        while node1 != nil || node2 != nil {
            sum += (node1?.val ?? 0) + (node2?.val ?? 0)
            prevNode.next = ListNode(sum % 10)
            prevNode = prevNode.next!
            sum /= 10
            node1 = node1?.next
            node2 = node2?.next
        }
        
        if sum > 0 {
            prevNode.next = ListNode(sum)
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
