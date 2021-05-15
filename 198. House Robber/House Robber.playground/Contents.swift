//Runtime: 4 ms, faster than 85.51% of Swift online submissions for House Robber.
//Memory Usage: 13.9 MB, less than 63.55% of Swift online submissions for House Robber.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.rob([1,2,3,1]))
print(solution.rob([2,7,9,3,1]))

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count <= 1 { return nums[0] }
        
        var maxValue = max(nums[0], nums[1])
        var maxArray: [Int] = [nums[0], maxValue]
        
        for i in 2 ..< nums.count {
            maxValue = max(maxArray[i - 2] + nums[i], maxArray[i - 1])
            maxArray.append(maxValue)
        }
        
        return maxValue
    }
}
