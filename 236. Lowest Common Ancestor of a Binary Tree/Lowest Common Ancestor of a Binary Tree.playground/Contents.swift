//Runtime: 76 ms, faster than 60.81% of Swift online submissions for Lowest Common Ancestor of a Binary Tree.
//Memory Usage: 19.1 MB, less than 71.50% of Swift online submissions for Lowest Common Ancestor of a Binary Tree.

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
        if root == nil { return nil }
        if root === p || root === q { return root }
        
        let leftAncestor = lowestCommonAncestor(root!.left, p, q)
        let rightAncestor = lowestCommonAncestor(root!.right, p, q)
        
        if leftAncestor != nil {
            if rightAncestor != nil {
                return root
            } else {
                return leftAncestor
            }
        } else {
            return rightAncestor
        }
    }
}
