//Runtime: 12 ms, faster than 85.06% of Swift online submissions for Binary Tree Level Order Traversal.
//Memory Usage: 14.5 MB, less than 41.95% of Swift online submissions for Binary Tree Level Order Traversal.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(solution.levelOrder(node1))
let node2 = TreeNode(1)
print(solution.levelOrder(node2))
print(solution.levelOrder(nil))
let node3 = TreeNode(1, TreeNode(2, TreeNode(4), nil), TreeNode(3, nil, TreeNode(5)))
print(solution.levelOrder(node3))

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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }

        var ret: [[Int]] = [[]]
        var currentQueue: [TreeNode] = [root!]
        var nextQueue = [TreeNode]()
        
        while !currentQueue.isEmpty {
            let node = currentQueue.removeFirst()
            ret[ret.count - 1].append(node.val)
            
            if node.left != nil { nextQueue.append(node.left!) }
            if node.right != nil { nextQueue.append(node.right!) }
            
            if currentQueue.isEmpty && !nextQueue.isEmpty {
                currentQueue = nextQueue
                nextQueue = [TreeNode]()
                ret.append([Int]())
            }
        }

        return ret
    }
}
