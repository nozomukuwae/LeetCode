//Runtime: 40 ms, faster than 47.63% of Swift online submissions for Move Zeroes.
//Memory Usage: 15 MB, less than 40.46% of Swift online submissions for Move Zeroes.

import Foundation

let solution = Solution()
var nums = [0,1,0,3,12]
solution.moveZeroes(&nums)
print(nums)

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroCount = 0
        var i = 0
        while i < nums.count {
            if nums[i] == 0 {
                zeroCount += 1
                nums.remove(at: i)
            } else {
                i += 1
            }
        }

        nums.append(contentsOf: [Int](repeating: 0, count: zeroCount))
    }
}
