//Runtime: 8 ms, faster than 99.71% of Swift online submissions for Merge Two Sorted Lists.
//Memory Usage: 14.4 MB, less than 15.08% of Swift online submissions for Merge Two Sorted Lists.

import UIKit

let solution = Solution()
let l1 = ListNode(1, ListNode(2, ListNode(4)))
let l2 = ListNode(1, ListNode(3, ListNode(4)))

print(solution.mergeTwoLists(l1, l2)!.toString())

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var p1 = l1
        var p2 = l2
        let mergedList = ListNode()
        
        if p1!.val < p2!.val {
            mergedList.val = p1!.val
            p1 = p1!.next
        } else {
            mergedList.val = p2!.val
            p2 = p2!.next
        }

        var currentNode: ListNode? = mergedList

        while p1 != nil && p2 != nil {
            if p1!.val < p2!.val {
                currentNode!.next = ListNode(p1!.val)
                p1 = p1!.next
            } else {
                currentNode!.next = ListNode(p2!.val)
                p2 = p2!.next
            }
            
            currentNode = currentNode!.next
        }
        
        while p1 != nil {
            currentNode!.next = ListNode(p1!.val)
            p1 = p1!.next
            currentNode = currentNode!.next
        }

        while p2 != nil {
            currentNode!.next = ListNode(p2!.val)
            p2 = p2!.next
            currentNode = currentNode!.next
        }
        
        return mergedList
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    func toString() -> String {
        if let next = self.next {
            return String(self.val) + "," + next.toString()
        } else {
            return String(self.val)
        }
    }
}
