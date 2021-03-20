//Runtime: 60 ms, faster than 15.65% of Swift online submissions for Maximum Subarray.
//Memory Usage: 14.4 MB, less than 22.52% of Swift online submissions for Maximum Subarray.

import UIKit

let solution = Solution()
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        return maxSubArray(nums, start: 0, end: nums.count - 1)
    }
    
    func maxSubArray(_ nums: [Int], start: Int, end: Int) -> Int {
        if start >= end {
            return nums[start]
        }
               
        return max(maxSubArray(nums, start: start, end: (start + end) / 2),
                   maxSubArray(nums, start: (start + end) / 2 + 1, end: end),
                   crossMax(nums, start: start, end: end))
    }
    
    func crossMax(_ nums: [Int], start: Int, end: Int) -> Int {
        var leftCurrentSum = 0
        var leftMax = Int.min
        for i in stride(from: (start + end) / 2, through: start, by: -1) {
            leftCurrentSum += nums[i]
            leftMax = max(leftMax, leftCurrentSum)
        }
        
        var rightCurrentSum = 0
        var rightMax = Int.min
        for i in (start + end) / 2 + 1 ... end {
            rightCurrentSum += nums[i]
            rightMax = max(rightMax, rightCurrentSum)
        }
        
        return leftMax + rightMax
    }
}
