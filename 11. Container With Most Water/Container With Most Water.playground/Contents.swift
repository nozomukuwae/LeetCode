//Time Limit Exceeded

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
        var maxFromStart = [[Int]]()
        var maxFromEnd = [[Int]]()
        var maxArea = 0
        
        var maxHeightFromStart = 0
        for i in 0 ..< height.count - 1 {
            if height[i] <= maxHeightFromStart {
                continue
            }
            
            maxHeightFromStart = height[i]
            maxFromStart.append([i, height[i]])
        }
        
        var maxHeightFromEnd = 0
        var j = height.count - 1
        while j > 0 {
            if height[j] > maxHeightFromEnd {
                maxHeightFromEnd = height[j]
                maxFromEnd.append([j, height[j]])
            }

            j -= 1
        }
        
        for k in 0 ..< maxFromStart.count {
            for l in 0 ..< maxFromEnd.count {
                if maxFromStart[k][0] >= maxFromEnd[l][0] {
                    continue
                }

                maxArea = max(maxArea, min(maxFromStart[k][1], maxFromEnd[l][1]) * (maxFromEnd[l][0] - maxFromStart[k][0]))
            }
        }
        
        return maxArea
    }
}
