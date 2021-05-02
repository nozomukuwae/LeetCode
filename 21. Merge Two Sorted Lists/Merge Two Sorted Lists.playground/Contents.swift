//Runtime: 12 ms, faster than 82.76% of Swift online submissions for Merge Two Sorted Lists.
//Memory Usage: 13.7 MB, less than 80.43% of Swift online submissions for Merge Two Sorted Lists.

// Time complexity: O(N+M)
// Space complexity: O(1)

import Foundation

let solution = Solution()
let node1 = ListNodeUtil.create([1,2,4])
let node2 = ListNodeUtil.create([1,3,4])

//let node1 = ListNodeUtil.create([])
//let node2 = ListNodeUtil.create([])

let merged = solution.mergeTwoLists(node1, node2)
ListNodeUtil.printNodes(merged)

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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var firstNode: ListNode? = nil
        var node1 = l1
        var node2 = l2
        if node1!.val < node2!.val {
            firstNode = node1
            node1 = node1!.next
        } else {
            firstNode = node2
            node2 = node2!.next
        }
        var prevNode = firstNode
        
        while node1 != nil && node2 != nil {
            if node1!.val < node2!.val {
                prevNode!.next = node1
                prevNode = node1
                node1 = node1!.next
            } else {
                prevNode!.next = node2
                prevNode = node2
                node2 = node2!.next
            }
        }
        
        prevNode!.next = node1 ?? node2
        
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
