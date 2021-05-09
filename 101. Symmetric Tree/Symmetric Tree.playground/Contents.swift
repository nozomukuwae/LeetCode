//Runtime: 12 ms, faster than 83.24% of Swift online submissions for Symmetric Tree.
//Memory Usage: 14.4 MB, less than 7.54% of Swift online submissions for Symmetric Tree.

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
        typealias Pair = (left: TreeNode?, right: TreeNode?)
        
        var stack = [Pair]()
        stack.append(Pair(root?.left, root?.right))
        
        while let pair = stack.popLast() {
            if pair.left == nil && pair.right == nil { continue }
            if pair.left?.val != pair.right?.val { return false }
            
            stack.append(Pair(pair.left!.left, pair.right!.right))
            stack.append(Pair(pair.left!.right, pair.right!.left))
        }
        
        return true
    }
}
