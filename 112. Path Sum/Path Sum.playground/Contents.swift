//Runtime: 32 ms, faster than 95.61% of Swift online submissions for Path Sum.
//Memory Usage: 14.3 MB, less than 93.86% of Swift online submissions for Path Sum.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1 = TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2)), nil), TreeNode(8, TreeNode(13), TreeNode(4, nil, TreeNode(1))))
let node2 = TreeNode(1, TreeNode(2), TreeNode(3))
let node3 = TreeNode(1, TreeNode(2), nil)
print(solution.hasPathSum(node1, 22))
print(solution.hasPathSum(node2, 5))
print(solution.hasPathSum(node3, 0))

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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        
        return hasPathSumSub(root!, targetSum)
    }
    
    func hasPathSumSub(_ node: TreeNode, _ targetSum: Int) -> Bool {
        if node.left == nil {
            if node.right == nil {
                return node.val == targetSum
            } else {
                return hasPathSumSub(node.right!, targetSum - node.val)
            }
        } else {
            if node.right == nil {
                return hasPathSumSub(node.left!, targetSum - node.val)
            } else {
                return hasPathSumSub(node.left!, targetSum - node.val)
                    || hasPathSumSub(node.right!, targetSum - node.val)
            }
        }
    }
}
