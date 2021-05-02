//Runtime: 64 ms, faster than 84.17% of Swift online submissions for Linked List Cycle.
//Memory Usage: 15.4 MB, less than 98.62% of Swift online submissions for Linked List Cycle.

// Time complexity: O(N)
// Space complexity: O(1)

import Foundation

let solution = Solution()
let node = ListNodeUtil.create([1,2,4], pos: 1)
print(solution.hasCycle(node))

class ListNodeUtil {
    static func create(_ array: [Int], pos: Int) -> ListNode? {
        if array.count <= 0 { return nil }
        var finalNode: ListNode? = nil
        let firstNode = ListNode(array[0])
        if pos == 0 {
            finalNode = firstNode
        }
        
        var prevNode: ListNode = firstNode
        for i in 1 ..< array.count {
            let node = ListNode(array[i])
            if i == pos {
                finalNode = node
            }
            
            prevNode.next = node
            prevNode = node
        }
        
        prevNode.next = finalNode
        return firstNode
    }
    
    static func printNodes(_ head: ListNode?) {
        print(head?.val)
        if let next = head?.next {
            printNodes(next)
        }
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var turtle = head
        var hare = head
        while turtle != nil && hare != nil && hare!.next != nil {
            hare = hare!.next!.next
            turtle = turtle!.next
            
            if turtle === hare {
                return true
            }
        }
        
        return false
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
