//Runtime: 1820 ms, faster than 5.15% of Swift online submissions for Maximum Subarray.
//Memory Usage: 14.5 MB, less than 10.88% of Swift online submissions for Maximum Subarray.

import UIKit

let solution = Solution()
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        
        for i in 0 ..< nums.count {
            var sum = nums[i]
            maxSum = max(maxSum, sum)
            
            for j in i + 1 ..< nums.count {
                sum += nums[j]
                maxSum = max(maxSum, sum)
            }
        }
        
        return maxSum
    }
}
