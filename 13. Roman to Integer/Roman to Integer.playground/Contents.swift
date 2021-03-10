// Runtime: 12 ms, faster than 99.36% of Swift online submissions for Roman to Integer.
// Memory Usage: 14.6 MB, less than 42.33% of Swift online submissions for Roman to Integer.

import UIKit

let s = "MCMXCIII"
let solution = Solution()
let num = solution.romanToInt(s)

print(num)


class Solution {
    func romanToInt(_ s: String) -> Int {
        let dic: [Character: Int] = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
        
        var total = 0, prevVal = 0
        
        for char in s {
            if prevVal < dic[char]! {
                total -= prevVal
            } else {
                total += prevVal
            }
            
            prevVal = dic[char]!
        }
        
        total += prevVal // Last character is always summed up

        return total
    }
}
