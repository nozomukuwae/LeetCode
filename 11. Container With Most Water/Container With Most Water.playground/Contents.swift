//Time Limit Exceeded

// Time complexity: O(N^2)
// Space complexity: O(1)

import Foundation

let solution = Solution()
print(solution.maxArea([1,1]))
print(solution.maxArea([4,3,2,1,4]))
print(solution.maxArea([1,2,1]))

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        
        for i in 0 ..< height.count {
            for j in i ..< height.count {
                maxArea = max(maxArea, min(height[i], height[j]) * (j - i))
            }
        }
        
        return maxArea
    }
}
