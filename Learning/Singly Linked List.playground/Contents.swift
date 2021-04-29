import Foundation

let list = LinkedList([5,1,3,7])
list.printNodes()

class LinkedList {
    var head: Node?
    
    init(_ array: [Int]) {
        if array.count > 0 {
            var node = Node(array[0])
            self.head = node
        
            for i in 1 ..< array.count {
                node.next = Node(array[i])
                node = node.next!
            }
        }
    }
    
    func printNodes() {
        var node = self.head
        var str = ""
        while node != nil {
            str += String(node!.key) + " "
            node = node?.next
        }
        
        print(str)
    }
}

class Node {
    var next: Node?
    var key: Int
    
    init(_ key: Int) {
        self.key = key
    }
}
