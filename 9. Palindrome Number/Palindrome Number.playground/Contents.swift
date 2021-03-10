//Runtime: 44 ms, faster than 73.33% of Swift online submissions for Palindrome Number.
//Memory Usage: 14.3 MB, less than 33.67% of Swift online submissions for Palindrome Number.

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
        
        var i = 0, j = digits.count - 1
        while i < j {
            if digits[i] != digits[j] {
                return false
            }
            
            i += 1
            j -= 1
        }
                
        return true
    }
}
