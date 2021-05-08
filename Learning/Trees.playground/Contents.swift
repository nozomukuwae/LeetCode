import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

let root = Node(4)
root.left = Node(5)
root.right = Node(6)
root.left!.left = Node(7)
