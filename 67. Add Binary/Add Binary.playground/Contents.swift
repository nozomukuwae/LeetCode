//Runtime: 8 ms, faster than 94.72% of Swift online submissions for Add Binary.
//Memory Usage: 14.4 MB, less than 59.24% of Swift online submissions for Add Binary.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.addBinary("11", "1"))
print(solution.addBinary("1010", "1011"))
print(solution.addBinary("1110001", "110100100"))

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let aReversed: [Character] = a.reversed()
        let bReversed: [Character] = b.reversed()
        
        var ret = ""
        var sum: UInt8 = 0
        var i = 0
        while i < aReversed.count && i < bReversed.count {
            sum += aReversed[i].asciiValue! + bReversed[i].asciiValue! - 96
            
            if sum > 1 {
                ret.insert(Character(UnicodeScalar(sum + 46)), at: ret.startIndex) // sum - 2 + 48
                sum = 1
            } else {
                ret.insert(Character(UnicodeScalar(sum + 48)), at: ret.startIndex)
                sum = 0
            }
            
            i += 1
        }
        
        while i < aReversed.count {
            sum += aReversed[i].asciiValue! - 48
            
            if sum > 1 {
                ret.insert(Character(UnicodeScalar(sum + 46)), at: ret.startIndex) // sum - 2 + 48
                sum = 1
            } else {
                ret.insert(Character(UnicodeScalar(sum + 48)), at: ret.startIndex)
                sum = 0
            }
            
            i += 1
        }
        
        while i < bReversed.count {
            sum += bReversed[i].asciiValue! - 48
            
            if sum > 1 {
                ret.insert(Character(UnicodeScalar(sum + 46)), at: ret.startIndex) // sum - 2 + 48
                sum = 1
            } else {
                ret.insert(Character(UnicodeScalar(sum + 48)), at: ret.startIndex)
                sum = 0
            }
            
            i += 1
        }
        
        if sum > 0 {
            ret.insert("1", at: ret.startIndex)
        }
        
        return ret
    }
}
