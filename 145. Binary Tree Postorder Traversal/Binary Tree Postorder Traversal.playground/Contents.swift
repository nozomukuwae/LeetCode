//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Binary Tree Postorder Traversal.
//Memory Usage: 13.7 MB, less than 98.60% of Swift online submissions for Binary Tree Postorder Traversal.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1 = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
print(solution.postorderTraversal(node1))
print(solution.postorderTraversal(nil))
print(solution.postorderTraversal(TreeNode(1)))
let node2 = TreeNode(1, TreeNode(2), nil)
print(solution.postorderTraversal(node2))
let node3 = TreeNode(1, nil, TreeNode(2))
print(solution.postorderTraversal(node3))
let node4 = TreeNode(3, TreeNode(2), TreeNode(4, nil, TreeNode(1)))
print(solution.postorderTraversal(node4))

let node11 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(solution.postorderTraversal(node11))
let node12 = TreeNode(1, TreeNode(21, TreeNode(31, TreeNode(41), TreeNode(42)), TreeNode(32, TreeNode(43), TreeNode(44))), TreeNode(22, TreeNode(33, TreeNode(45), TreeNode(46)), TreeNode(34, TreeNode(47), TreeNode(48))))
print(solution.postorderTraversal(node12))

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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        
        var nodeStack: [TreeNode] = [root!]
        var valStack: [Int] = []
        
        while let node = nodeStack.popLast() {
            valStack.insert(node.val, at: 0)
            
            if node.left != nil { nodeStack.append(node.left!) }
            if node.right != nil { nodeStack.append(node.right!) }
        }
        
        return valStack
    }
}
