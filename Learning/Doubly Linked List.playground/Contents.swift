import Foundation

let list = LinkedList([5,1,3,7])

list.printNodes(reversely: false)
list.printNodes(reversely: true)

class LinkedList {
    var head: Node?
    var tail: Node?
    
    init(_ array: [Int]) {
        if array.count > 0 {
            var node = Node(array[0])
            self.head = node
        
            for i in 1 ..< array.count {
                let newNode = Node(array[i])
                node.next = newNode
                newNode.prev = node
                node = newNode
            }
            
            self.tail = node
        }
    }
    
    func printNodes(reversely: Bool) {
        var node = reversely ? self.tail : self.head
        var str = ""
        while node != nil {
            str += String(node!.key) + " "
            node = reversely ? node?.prev : node?.next
        }
        
        print(str)
    }
}

class Node {
    var prev: Node?
    var next: Node?
    var key: Int
    
    init(_ key: Int) {
        self.key = key
    }
}
