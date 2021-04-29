import Foundation

let list = LinkedList([5,1,3,7])
list.insert(key: 2, position: 2)
list.delete(key: 5)

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
    
    func insert(key: Int, position: Int) {
        guard position >= 0 else {
            assertionFailure("Position is out of range")
            return
        }
        
        let node = Node(key)

        if position == 0 {
            node.next = self.head
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

            node.next = m.next
            m.next = node
        }
    }
    
    func delete(key: Int) {
        if self.head?.key == key {
            self.head = self.head?.next
        } else {
            var n = self.head
            while n != nil && n?.next?.key != key {
                n = n?.next
            }
            
            guard let m = n else {
                return
            }
            
            m.next = m.next?.next
        }
    }
}

class Node {
    var next: Node?
    var key: Int
    
    init(_ key: Int) {
        self.key = key
    }
}
