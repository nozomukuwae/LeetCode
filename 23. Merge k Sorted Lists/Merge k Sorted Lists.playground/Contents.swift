//Runtime: 84 ms, faster than 71.49% of Swift online submissions for Merge k Sorted Lists.
//Memory Usage: 15.5 MB, less than 68.42% of Swift online submissions for Merge k Sorted Lists.

// Time complexity: O(NlogK) where N = total number of the nodes
// Space complexity: O(K)

import Foundation

let solution = Solution()

let node1 = solution.mergeKLists([ListNodeUtil.create([1,4,5]), ListNodeUtil.create([1,3,4]), ListNodeUtil.create([2,6])])
ListNodeUtil.printNodes(node1)
//let node2 = solution.mergeKLists([])
//ListNodeUtil.printNodes(node2)
//let node3 = solution.mergeKLists([ListNodeUtil.create([])])
//ListNodeUtil.printNodes(node3)
//let node4 = solution.mergeKLists([ListNodeUtil.create([]), ListNodeUtil.create([1])])
//ListNodeUtil.printNodes(node4)

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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        
        var mergedLists = [ListNode?]()
        var i = 0
        var j = lists.count - 1
        while i < j {
            mergedLists.append(mergeTwoLists(lists[i], lists[j]))
            i += 1
            j -= 1
        }
        
        if i == j {
            mergedLists.append(lists[i])
        }
        
        while j > 0 {
            i = 0
            
            while i < j {
                mergedLists[i] = mergeTwoLists(mergedLists[i], mergedLists[j])
                i += 1
                j -= 1
            }
        }
        
        return mergedLists[0]
    }
    
    func mergeTwoLists(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        guard node1 != nil else { return node2 }
        guard node2 != nil else { return node1 }
        
        var firstNode: ListNode
        var n1, n2: ListNode?
        if node1!.val <= node2!.val {
            firstNode = node1!
            n1 = firstNode.next
            n2 = node2
        } else {
            firstNode = node2!
            n1 = node1
            n2 = firstNode.next
        }
        var prevNode = firstNode
        
        while n1 != nil && n2 != nil {
            if n1!.val <= n2!.val {
                prevNode.next = n1
                prevNode = n1!
                n1 = n1!.next
            } else {
                prevNode.next = n2
                prevNode = n2!
                n2 = n2!.next
            }
        }
        
        if n1 != nil {
            prevNode.next = n1
        } else if n2 != nil {
            prevNode.next = n2
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
