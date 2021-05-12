//Runtime: 12 ms, faster than 85.06% of Swift online submissions for Binary Tree Level Order Traversal.
//Memory Usage: 14.3 MB, less than 78.45% of Swift online submissions for Binary Tree Level Order Traversal.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(solution.levelOrder(node1))
let node2 = TreeNode(1)
print(solution.levelOrder(node2))
print(solution.levelOrder(nil))

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
        var queue = [[Int]]()

        if root == nil { return queue }
        queue.append([root!.val])
        
        appendToQueue(root!.left, &queue, 1)
        appendToQueue(root!.right, &queue, 1)
        return queue
    }
    
    func appendToQueue(_ node: TreeNode?, _ queue: inout [[Int]], _ currentLevel: Int) {
        if node == nil { return }
        
        if queue.count <= currentLevel {
            queue.append([node!.val])
        } else {
            queue[currentLevel].append(node!.val)
        }
        
        appendToQueue(node!.left, &queue, currentLevel + 1)
        appendToQueue(node!.right, &queue, currentLevel + 1)
    }
}
