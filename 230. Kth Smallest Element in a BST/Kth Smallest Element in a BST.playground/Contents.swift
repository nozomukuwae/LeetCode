//Runtime: 76 ms, faster than 60.81% of Swift online submissions for Lowest Common Ancestor of a Binary Tree.
//Memory Usage: 19.1 MB, less than 71.50% of Swift online submissions for Lowest Common Ancestor of a Binary Tree.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1 = TreeNode(3, TreeNode(1, nil, TreeNode(2)), TreeNode(4))
let node2 = TreeNode(5, TreeNode(3, TreeNode(2, TreeNode(1), nil), TreeNode(4)), TreeNode(6))
print(solution.kthSmallest(node1, 1))
print(solution.kthSmallest(node2, 3))

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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var newRoot = TreeNode(root!.val)
        putInOrder(root!.left, &newRoot)
        putInOrder(root!.right, &newRoot)
        
        
        
        var map = [Int: Void]()
        for kv in map {
            
            
            
        }
        
        
        
        return 0
    }
    
    func putValue(_ node: TreeNode?, _ map: inout [Int: Void]) {
        
        
    }
    
    
    func putInOrder(_ node: TreeNode?, _ newRoot: inout TreeNode) {
        if node == nil { return }
        var newNode = TreeNode(node!.val)
        
        
    }
    
}
