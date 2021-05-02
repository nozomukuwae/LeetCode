//Runtime: 16 ms, faster than 26.27% of Swift online submissions for Reverse Linked List.
//Memory Usage: 15.2 MB, less than 18.19% of Swift online submissions for Reverse Linked List.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()

let node = ListNodeUtil.create([1,2,3,4,5])
ListNodeUtil.printNodes(solution.reverseList(node))

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
    func reverseList(_ head: ListNode?) -> ListNode? {
        return reverseListRecursively(nil, head)
    }
    
    func reverseListRecursively(_ previous: ListNode?, _ current: ListNode?) -> ListNode? {
        if current == nil { return previous }
        
        let next = current!.next
        current!.next = previous
        
        return reverseListRecursively(current, next)
    }

    func reverseListIteratively(_ head: ListNode?) -> ListNode? {
        var prevNode = head
        var node = head?.next
        head?.next = nil
        var nextNode: ListNode? = nil
        
        while node != nil {
            nextNode = node!.next
            node!.next = prevNode
            prevNode = node
            node = nextNode
        }
        
        return prevNode
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
