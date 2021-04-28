
//Runtime: 1696 ms, faster than 9.78% of Swift online submissions for LRU Cache.
//Memory Usage: 16.9 MB, less than 40.10% of Swift online submissions for LRU Cache.

// get
// Time complexity: O(N)

// put
// Time complexity: O(N)

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

class LRUCache {
    let capacity: Int
    var keys = [Int]()
    var dict = [Int: Int]()

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if dict[key] == nil {
            return -1
        }
        
        // Remove the key in keys and move it to the end
        removeKey(key)
        keys.append(key)
        
        return dict[key]!
    }
    
    func put(_ key: Int, _ value: Int) {
        if dict[key] != nil {
            // Remove the key in keys
            removeKey(key)
        } else {
            if keys.count >= capacity {
                dict[keys[0]] = nil
                keys.removeFirst()
            }
        }
        keys.append(key)
        
        dict[key] = value
    }
    
    func removeKey(_ key: Int) {
        if let index = keys.firstIndex(of: key) {
            keys.remove(at: index)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
