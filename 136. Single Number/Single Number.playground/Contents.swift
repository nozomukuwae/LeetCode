//Runtime: 136 ms, faster than 71.79% of Swift online submissions for Single Number.
//Memory Usage: 14.7 MB, less than 81.38% of Swift online submissions for Single Number.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.singleNumber([2,1,1]))
print(solution.singleNumber([4,1,2,1,2]))
print(solution.singleNumber([1]))
print(solution.singleNumber([-336,513,-560,-481,-174,101,-997,40,-527,-784,-283,-336,513,-560,-481,-174,101,-997,40,-527,-784,-283,354]))

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        let unique = Set(nums)
        return 2 * unique.reduce(0, +) - nums.reduce(0, +)
    }
}
