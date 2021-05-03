//Runtime: 4 ms, faster than 98.58% of Swift online submissions for Remove Nth Node From End of List.
//Memory Usage: 13.8 MB, less than 83.18% of Swift online submissions for Remove Nth Node From End of List.

// Time complexity: O(N)
// Space complexity: O(1)

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
        var n1 = head?.next
        var count = 0
        while n1 != nil && count < n {
            n1 = n1!.next
            count += 1
        }
        
        if count < n {
            return head?.next
        }
        
        var n2 = head
        while n1 != nil {
            n1 = n1!.next
            n2 = n2!.next
        }
        
        n2!.next = n2!.next?.next
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
