//Runtime: 2964 ms, faster than 5.46% of Swift online submissions for Lowest Common Ancestor of a Binary Tree.
//Memory Usage: 443.8 MB, less than 6.18% of Swift online submissions for Lowest Common Ancestor of a Binary Tree.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1q2 = TreeNode(4)
let node1p = TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), node1q2))
let node1q1 = TreeNode(1, TreeNode(0), TreeNode(8))
let node1 = TreeNode(3, node1p, node1q1)
print(solution.lowestCommonAncestor(node1, node1p, node1q1)!.val)
print(solution.lowestCommonAncestor(node1, node1p, node1q2)!.val)

let node2q = TreeNode(2)
let node2 = TreeNode(1, node2q, nil)
print(solution.lowestCommonAncestor(node2, node2, node2q)!.val)

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        let pQueue = queueToReach(root, p!, [])!
        let qQueue = queueToReach(root, q!, [])!
        
        var i = 0
        while i < pQueue.count && i < qQueue.count && pQueue[i] === qQueue[i] {
            i += 1
        }
        
        return pQueue[i - 1]
    }
    
    func queueToReach(_ current: TreeNode?, _ target: TreeNode, _ queue: [TreeNode]) -> [TreeNode]? {
        if current == nil { return nil }

        var currentQueue = queue
        currentQueue.append(current!)
        if current === target { return currentQueue }
        
        if let leftQueue = queueToReach(current!.left, target, currentQueue) {
            return leftQueue
        } else if let rightQueue = queueToReach(current!.right, target, currentQueue) {
            return rightQueue
        }
        
        return nil
    }
}
