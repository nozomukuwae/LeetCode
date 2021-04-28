//Runtime: 304 ms, faster than 52.74% of Swift online submissions for LRU Cache.
//Memory Usage: 16.4 MB, less than 97.37% of Swift online submissions for LRU Cache.

// get
// Time complexity: O(1)

// put
// Time complexity: O(1)

// Space complexity: O(N)

import Foundation

let lRUCache = LRUCache(2)
lRUCache.put(1, 1) // cache is {1=1}
lRUCache.put(2, 2) // cache is {1=1, 2=2}
lRUCache.get(1)    // return 1
lRUCache.put(3, 3) // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
lRUCache.get(2)    // returns -1 (not found)
lRUCache.put(4, 4) // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lRUCache.get(1)    // return -1 (not found)
lRUCache.get(3)    // return 3
lRUCache.get(4)    // return 4

//let lRUCache = LRUCache(1)
//lRUCache.put(2, 1) // cache is {2=1}
//lRUCache.get(2)    // return 1
//lRUCache.put(3, 2) // LRU key was 2, evicts key 2, cache is {3=2}
//lRUCache.get(2)    // returns -1 (not found)
//lRUCache.get(3)    // returns 2

//let lRUCache = LRUCache(2)
//lRUCache.put(2, 1) // cache is {2=1}
//lRUCache.put(3, 2) // cache is {3=2, 2=1}
//lRUCache.get(3)    // return 2
//lRUCache.get(2)    // return 1 <-- HERE
//lRUCache.put(4, 3) // LRU key was 3, evicts key 3, cache is {4=3, 2=1}
//lRUCache.get(2)    // return 1
//lRUCache.get(3)    // returns -1 (not found)
//lRUCache.get(4)    // return 3

class LRUCache {
    let capacity: Int
    var dict = [Int: LinkedNode]()
    var head: LinkedNode? = nil
    var tail: LinkedNode? = nil

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if dict[key] != nil {
            // Move the key in dict to dict's head
            moveToHead(dict[key]!)
            
            return dict[key]!.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if dict[key] != nil {
            // Move the key in dict to dict's head
            moveToHead(dict[key]!)
            
            dict[key]!.value = value
        } else {
            if dict.count >= capacity {
                // Remove the tail
                removeTail()
            }
            
            // Insert the key into dict's head
            createNode(key, value)
        }
    }
    
    func printNodes() {
        print("")
        var node = self.head
        while node != nil {
            print("\(node!.key) : \(node!.value)")
            node = node!.next
        }
    }
    
    func moveToHead(_ node: LinkedNode) {
        if node.key != self.head?.key {
            node.prev?.next = node.next
            if node.next != nil {
                node.next!.prev = node.prev
            } else {
                self.tail = node.prev
            }
            
            node.next = self.head
            node.prev = nil
            self.head!.prev = node
            
            self.head = node
        }
    }
    
    func removeTail() {
        if self.tail != nil {
            if self.tail!.key == self.head?.key {
                dict[self.tail!.key] = nil
                self.head = nil
                self.tail = nil
            } else {
                dict[self.tail!.key] = nil
                self.tail = self.tail!.prev
                self.tail!.next = nil
            }
        }
    }
    
    func createNode(_ key: Int, _ value: Int) {
        let node = LinkedNode(key: key, value: value)
        node.next = self.head
        self.head?.prev = node
        self.head = node
        if self.tail == nil {
            self.tail = node
        }
        
        dict[key] = node
    }
}

class LinkedNode {
    var prev: LinkedNode?
    var next: LinkedNode?
    let key: Int
    var value: Int
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
