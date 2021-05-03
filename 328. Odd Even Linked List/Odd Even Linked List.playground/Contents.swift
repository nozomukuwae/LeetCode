//Runtime: 24 ms, faster than 99.19% of Swift online submissions for Odd Even Linked List.
//Memory Usage: 15.1 MB, less than 34.15% of Swift online submissions for Odd Even Linked List.

// Time complexity: O(N)
// Space complexity: O(1)

import Foundation

let solution = Solution()

let node1 = ListNodeUtil.create([1,2,3,4,5])
let node2 = ListNodeUtil.create([2,1,3,5,6,4,7])

let newNode1 = solution.oddEvenList(node1)
let newNode2 = solution.oddEvenList(node2)
ListNodeUtil.printNodes(newNode1)
print("")
ListNodeUtil.printNodes(newNode2)

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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard var odd = head else { return nil }
        var even = head?.next
        let evenHead = even
        
        while even != nil && even?.next != nil {
            odd.next = even!.next
            even!.next = even!.next!.next
            odd = odd.next!
            even = even!.next
        }
        
        odd.next = evenHead
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
