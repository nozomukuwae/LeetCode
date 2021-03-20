//Runtime: 32 ms, faster than 87.02% of Swift online submissions for Maximum Subarray.
//Memory Usage: 14.3 MB, less than 48.28% of Swift online submissions for Maximum Subarray.

import UIKit

let solution = Solution()
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var currentSum = nums[0]
        var maxSum = nums[0]
        
        for i in 1 ..< nums.count {
            currentSum = max(currentSum + nums[i], nums[i])
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum
    }
}
