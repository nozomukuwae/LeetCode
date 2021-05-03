//Time Limit Exceeded

// Time complexity: O(KN) where N = element number of the longest linked list
// Space complexity: O(K)

import Foundation

let solution = Solution()

let node1 = solution.mergeKLists([ListNodeUtil.create([1,4,5]), ListNodeUtil.create([1,3,4]), ListNodeUtil.create([2,6])])
ListNodeUtil.printNodes(node1)
let node2 = solution.mergeKLists([])
ListNodeUtil.printNodes(node2)
let node3 = solution.mergeKLists([ListNodeUtil.create([])])
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var nextNodes = [Int: ListNode]()
        for i in 0 ..< lists.count {
            nextNodes[i] = lists[i]
        }
        guard nextNodes.count > 0 else { return nil }

        var minVal = Int.max
        var minValIndex = 0
        for i in 0 ..< lists.count {
            if nextNodes[i] != nil && nextNodes[i]!.val < minVal {
                minVal = nextNodes[i]!.val
                minValIndex = i
            }
        }
        let firstNode: ListNode = nextNodes[minValIndex]!
        var prevNode: ListNode = nextNodes[minValIndex]!
        nextNodes[minValIndex] = nextNodes[minValIndex]!.next
        
        while nextNodes.count > 0 {
            minVal = Int.max
            for i in 0 ..< lists.count {
                if nextNodes[i] != nil && nextNodes[i]!.val < minVal {
                    minVal = nextNodes[i]!.val
                    minValIndex = i
                }
            }
            
            prevNode.next = nextNodes[minValIndex]!
            prevNode = nextNodes[minValIndex]!
            nextNodes[minValIndex] = nextNodes[minValIndex]!.next
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
