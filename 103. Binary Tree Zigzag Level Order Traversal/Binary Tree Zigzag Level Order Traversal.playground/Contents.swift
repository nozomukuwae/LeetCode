//Runtime: 4 ms, faster than 100.00% of Swift online submissions for Binary Tree Zigzag Level Order Traversal.
//Memory Usage: 14.4 MB, less than 44.00% of Swift online submissions for Binary Tree Zigzag Level Order Traversal.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
let node1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(solution.zigzagLevelOrder(node1))
let node2 = TreeNode(1)
print(solution.zigzagLevelOrder(node2))
print(solution.zigzagLevelOrder(nil))
let node3 = TreeNode(1, TreeNode(2, TreeNode(4), nil), TreeNode(3, nil, TreeNode(5)))
print(solution.zigzagLevelOrder(node3))
let node4 = TreeNode(1, TreeNode(21, TreeNode(31, TreeNode(41), TreeNode(42)), TreeNode(32, TreeNode(43), TreeNode(44))), TreeNode(22, TreeNode(33, TreeNode(45), TreeNode(46)), TreeNode(34, TreeNode(47), TreeNode(48))))
print(solution.zigzagLevelOrder(node4))

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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }

        var ret: [[Int]] = [[]]
        var currentStack: [TreeNode] = [root!]
        var nextStack = [TreeNode]()
        var fromLeft = true
        
        while let node = currentStack.popLast() {
            ret[ret.count - 1].append(node.val)
            
            if fromLeft {
                if node.left != nil { nextStack.append(node.left!) }
                if node.right != nil { nextStack.append(node.right!) }
            } else {
                if node.right != nil { nextStack.append(node.right!) }
                if node.left != nil { nextStack.append(node.left!) }
            }
            
            if currentStack.isEmpty {
                if nextStack.isEmpty {
                    break
                } else {
                    currentStack = nextStack
                    nextStack = [TreeNode]()
                    ret.append([Int]())
                    fromLeft.toggle()
                }
            }
        }

        return ret
    }
}
