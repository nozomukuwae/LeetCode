//Runtime: 2564 ms, faster than 5.11% of Swift online submissions for Container With Most Water.
//Memory Usage: 18.1 MB, less than 24.68% of Swift online submissions for Container With Most Water.

// Time complexity: O(N^2)
// Space complexity: O(1)

import Foundation

let solution = Solution()
print(solution.maxArea([1,1]))
print(solution.maxArea([4,3,2,1,4]))
print(solution.maxArea([1,2,1]))
print(solution.maxArea([1,8,6,2,5,4,8,3,7]))

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxI = 0
        var maxJ = 0
        var maxArea = 0
        
        for i in 0 ..< height.count {
            if height[i] <= maxI {
                continue
            }
            maxI = height[i]

            maxJ = 0
            var j = height.count - 1
            while j > i {
                if height[j] > maxJ {
                    maxJ = height[j]
                    maxArea = max(maxArea, min(height[i], height[j]) * (j - i))
                }

                j -= 1
            }
        }
        
        return maxArea
    }
}
