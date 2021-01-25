// Runtime: 20 ms, faster than 89.62% of Swift online submissions for Roman to Integer.
// Memory Usage: 14.8 MB, less than 21.73% of Swift online submissions for Roman to Integer.

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
            let val = dic[char]!
            if prevVal < val {
                total -= prevVal
            } else {
                total += prevVal
            }
            
            prevVal = val
        }
        
        total += prevVal // Last character is always summed up

        return total
    }
}
