import Foundation

class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int, left: Node? = nil, right: Node? = nil) {
        data = value
        self.left = left
        self.right = right
    }
    
    private func toArray(root: Node, to array: inout [Int]) {
        if let left = root.left {
            toArray(root: left, to: &array)
        }

        array.append(root.data)

        if let right = root.right {
            toArray(root: right, to: &array)
        }
    }
    
    func printArray() {
        var array = [Int]()
        toArray(root: self, to: &array)
        print(array)
    }
}

class NodeController {
    static func insert(root: Node, node: Node) {
        if node.data <= root.data {
            if let left = root.left {
                insert(root: left, node: node)
            } else {
                root.left = node
            }
        } else {
            if let right = root.right {
                insert(root: right, node: node)
            } else {
                root.right = node
            }
        }
    }
    
    static func preOrder(root: Node) {
        print(root.data)
        
        if let left = root.left {
            preOrder(root: left)
        }
        
        if let right = root.right {
            preOrder(root: right)
        }
    }
    
    static func search(root: Node, value: Int) -> Node? {
        if value == root.data {
            return root
        } else if value < root.data {
            if let left = root.left {
                return search(root: left, value: value)
            } else {
                return nil
            }
        } else {
            if let right = root.right {
                return search(root: right, value: value)
            } else {
                return nil
            }
        }
    }
    
    static func delete(root: Node, value: Int) -> Node? {
        if value == root.data {
            if root.left != nil, let right = root.right {
                var minNode = right
                var minNodeParent = root

                while minNode.left != nil {
                    minNodeParent = minNode
                    minNode = minNode.left!
                }

                minNodeParent.left = minNode.right
                root.data = minNode.data
            } else if root.left != nil {
                return root.left
            } else {
                return root.right
            }
        } else if value < root.data {
            if let left = root.left {
                root.left = delete(root: left, value: value)
            }
        } else {
            if let right = root.right {
                root.right = delete(root: right, value: value)
            }
        }
        
        return root
    }
}

let root = Node(10, left: Node(8, left: Node(5)), right: Node(12, left: Node(11), right: Node(15)))
root.printArray()

NodeController.insert(root: root, node: Node(14))
root.printArray()

NodeController.preOrder(root: root)

print(NodeController.search(root: root, value: 15)!.data)

NodeController.delete(root: root, value: 10)
root.printArray()
