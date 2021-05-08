import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

class TraverseUtil {
    // left root right
    static func inOrder(_ node: Node?) {
        guard let node = node else { return }
        inOrder(node.left)
        print(node.value)
        inOrder(node.right)
    }
    
    // root left right
    static func preOrder(_ node: Node?) {
        guard let node = node else { return }
        print(node.value)
        preOrder(node.left)
        preOrder(node.right)
    }
    
    // left right root
    static func postOrder(_ node: Node?) {
        guard let node = node else { return }
        postOrder(node.left)
        postOrder(node.right)
        print(node.value)
    }
    
}

let root = Node(4)
root.left = Node(5)
root.right = Node(6)
root.left!.left = Node(7)

TraverseUtil.inOrder(root)
print()
TraverseUtil.preOrder(root)
print()
TraverseUtil.postOrder(root)
