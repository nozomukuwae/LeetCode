import Foundation

let queue = Queue()
queue.enqueue(3)
queue.enqueue(7)
print(queue.front!)
queue.enqueue(9)
print(queue.length)
print(queue.dequeue()!)
print(queue.length)
print(queue.dequeue()!)
print(queue.length)

class Queue {
    var queue = [Int]()
    
    func enqueue(_ value: Int) {
        queue.append(value)
    }
    
    func dequeue() -> Int? {
        return queue.count > 0
            ? queue.removeFirst()
            : nil
    }
    
    var front: Int? {
        return queue.first
    }
    
    var length: Int {
        return queue.count
    }
}
