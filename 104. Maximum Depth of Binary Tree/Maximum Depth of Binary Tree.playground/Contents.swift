//Runtime: 24 ms, faster than 92.86% of Swift online submissions for Maximum Depth of Binary Tree.
//Memory Usage: 14.9 MB, less than 23.06% of Swift online submissions for Maximum Depth of Binary Tree.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1 = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3)))
print(solution.maxDepth(node1))
let node2 = TreeNode(1, TreeNode(2, nil, TreeNode(3)), TreeNode(2, nil, TreeNode(3)))
print(solution.maxDepth(node2))
let node3 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(solution.maxDepth(node3))
let node4 = TreeNode(1, nil, TreeNode(2))
print(solution.maxDepth(node4))
let node5: TreeNode? = nil
print(solution.maxDepth(node5))
let node6 = TreeNode(0)
print(solution.maxDepth(node6))

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
    func maxDepth(_ root: TreeNode?) -> Int {
        return maxDepth(root, 0)
    }
    
    func maxDepth(_ node: TreeNode?, _ currentDepth: Int) -> Int {
        guard node != nil else { return currentDepth }
        return max(maxDepth(node!.left, currentDepth + 1), maxDepth(node!.right, currentDepth + 1))
    }
}
