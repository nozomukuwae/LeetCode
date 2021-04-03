//Runtime: 680 ms, faster than 13.83% of Swift online submissions for Container With Most Water.
//Memory Usage: 18 MB, less than 34.47% of Swift online submissions for Container With Most Water.

// Time complexity: O(N)
// Space complexity: O(1)

import Foundation

let solution = Solution()
print(solution.maxArea([1,1]))
print(solution.maxArea([4,3,2,1,4]))
print(solution.maxArea([1,2,1]))
print(solution.maxArea([1,8,6,2,5,4,8,3,7]))

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        var maxArea = 0
        
        while i < j {
            maxArea = max(maxArea, min(height[i], height[j]) * (j - i))
            if height[i] <= height[j] {
                i += 1
            } else {
                j -= 1
            }
        }
        
        return maxArea
    }
}
