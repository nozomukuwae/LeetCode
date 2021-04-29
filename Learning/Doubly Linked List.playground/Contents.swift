import Foundation

let list = LinkedList([5,1,3,7])
list.insert(key: 2, position: 2)

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
    
    func insert(key: Int, position: Int) {
        guard position >= 0 else {
            assertionFailure("Position is out of range")
            return
        }
        
        let node = Node(key)

        if position == 0 {
            node.next = self.head
            self.head?.prev = node
            self.head = node
        } else {
            var n = self.head
            var count = 0
            while count < position - 1 && n != nil {
                n = n!.next
                count += 1
            }
            
            guard let m = n else {
                assertionFailure("Position is out of range")
                return
            }
            
            if m.next != nil {
                node.next = m.next
                m.next!.prev = node
            } else {
                self.tail = node
            }

            m.next = node
            node.prev = m
        }
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
