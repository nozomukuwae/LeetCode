//Runtime: 40 ms, faster than 82.67% of Swift online submissions for Palindrome Number.
//Memory Usage: 14 MB, less than 74.67% of Swift online submissions for Palindrome Number.

import UIKit

let solution = Solution()
let x = 123
print(solution.isPalindrome(x))

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        var n = x
        var digits = [Int]()
        while n > 0 {
            digits.append(n % 10)
            n /= 10
        }
        
        for i in 0 ..< digits.count / 2 {
            if digits[i] != digits[digits.count - 1 - i] {
                return false
            }
        }
                
        return true
    }
}
