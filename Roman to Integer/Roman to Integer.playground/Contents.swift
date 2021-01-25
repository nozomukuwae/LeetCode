// Runtime: 44 ms, faster than 18.85% of Swift online submissions for Roman to Integer.
// Memory Usage: 14.8 MB, less than 21.73% of Swift online submissions for Roman to Integer.

import UIKit

let s = "MCMXCIII"
let solution = Solution()
let num = solution.romanToInt(s)

print(num)


class Solution {
    let dic: [Character: Int] = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
    
    func romanToInt(_ s: String) -> Int {
        var chars = Array(s.reversed())
        var lastVal = dic[chars[0]]!
        
        var total = lastVal // Last character is always summed up
        chars.removeFirst()
        
        for char in chars {
            if dic[char]! >= lastVal {
                lastVal = dic[char]!
                total += lastVal
            } else {
                lastVal = dic[char]!
                total -= lastVal
            }
        }
        
        return total
    }
}
