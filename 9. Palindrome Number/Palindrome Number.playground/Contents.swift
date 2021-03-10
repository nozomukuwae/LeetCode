//Runtime: 52 ms, faster than 54.50% of Swift online submissions for Palindrome Number.
//Memory Usage: 14.5 MB, less than 21.33% of Swift online submissions for Palindrome Number.

import UIKit

let solution = Solution()
let x = 0
print(solution.isPalindrome(x))

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        
        var n = x
        var reverted = 0
        while reverted < n {
            reverted = reverted * 10 + n % 10
            n /= 10
        }
        
        if reverted / 10 == n || reverted == n {
            return true
        } else {
            return false
        }
    }
}
