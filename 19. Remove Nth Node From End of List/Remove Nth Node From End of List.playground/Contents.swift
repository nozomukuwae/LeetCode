//Runtime: 8 ms, faster than 62.09% of Swift online submissions for Remove Nth Node From End of List.
//Memory Usage: 14 MB, less than 54.98% of Swift online submissions for Remove Nth Node From End of List.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()

let node1 = ListNodeUtil.create([1,2,3,4,5])
let node2 = ListNodeUtil.create([1])
let node3 = ListNodeUtil.create([1,2])

let node_removed = solution.removeNthFromEnd(node1, 2)
ListNodeUtil.printNodes(node_removed)

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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var nodes = [ListNode]()
        var node = head
        while node != nil {
            nodes.append(node!)
            node = node!.next
        }
        
        if n >= nodes.count {
            return head?.next
        }
        
        node = nodes[nodes.count - n - 1]
        node!.next = n <= 1 ? nil : nodes[nodes.count - n + 1]
        return head
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
