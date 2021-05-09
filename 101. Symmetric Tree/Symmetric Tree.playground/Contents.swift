//Runtime: 12 ms, faster than 83.24% of Swift online submissions for Symmetric Tree.
//Memory Usage: 13.9 MB, less than 70.67% of Swift online submissions for Symmetric Tree.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1 = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3)))
let node2 = TreeNode(1, TreeNode(2, nil, TreeNode(3)), TreeNode(2, nil, TreeNode(3)))
print(solution.isSymmetric(node1))
print(solution.isSymmetric(node2))

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return areSymmetric(root?.left, root?.right)
    }
    
    func areSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        if left?.val != right?.val { return false }
        
        if !areSymmetric(left!.right, right!.left) { return false }
        if !areSymmetric(left!.left, right!.right) { return false }
        
        return true
    }
}
