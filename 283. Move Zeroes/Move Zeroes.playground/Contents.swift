//Runtime: 36 ms, faster than 93.98% of Swift online submissions for Move Zeroes.
//Memory Usage: 14.8 MB, less than 72.98% of Swift online submissions for Move Zeroes.

// In the past 2 solutions, I used [Int].remove(at:),
// but it increases complexity to move any elements after the index.

// Time complexity: O(N)
// Space complexity: O(1)

import Foundation

let solution = Solution()
var nums = [0,1,0,3,12]
solution.moveZeroes(&nums)
print(nums)

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var nonZeroIndex = 0
        
        for n in nums {
            if n != 0 {
                nums[nonZeroIndex] = n
                nonZeroIndex += 1
            }
        }
        
        for i in nonZeroIndex ..< nums.count {
            nums[i] = 0
        }
    }
}
