//Runtime: 4 ms, faster than 92.26% of Swift online submissions for Reverse Integer.
//Memory Usage: 13.8 MB, less than 85.63% of Swift online submissions for Reverse Integer.

import UIKit

let solution = Solution()
let x = 1534236469
print(solution.reverse(x))

class Solution {
    func reverse(_ x: Int) -> Int {
        var reversed = 0
        var n = x
        
        while n != 0 {
            reversed = reversed * 10 + n % 10
            n /= 10
        }
        
        if reversed > Int32.max || reversed < Int32.min {
            return 0
        } else {
            return reversed
        }
    }
}
