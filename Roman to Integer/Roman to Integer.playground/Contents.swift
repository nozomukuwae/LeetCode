// Runtime: 36 ms, faster than 31.15% of Swift online submissions for Roman to Integer.
// Memory Usage: 14.6 MB, less than 42.33% of Swift online submissions for Roman to Integer.

import UIKit

let s = "MCMXCIII"
let solution = Solution()
let num = solution.romanToInt(s)

print(num)


class Solution {
    let dic: [Character: Int] = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
    
    func romanToInt(_ s: String) -> Int {
        var chars = Array(s.reversed())
        var lastChar = chars[0]
        
        var total = dic[lastChar]! // Last character is always summed up
        chars.removeFirst()
        
        for char in chars {
            if dic[char]! >= dic[lastChar]! {
                total += dic[char]!
            } else {
                total -= dic[char]!
            }

            lastChar = char
        }
        
        return total
    }
}
