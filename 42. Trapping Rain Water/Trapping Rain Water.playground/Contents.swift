//Runtime: 28 ms, faster than 56.95% of Swift online submissions for Trapping Rain Water.
//Memory Usage: 14.3 MB, less than 45.03% of Swift online submissions for Trapping Rain Water.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.trap([0,1,0,2,1,0,1,3,2,1,2,1]))
print(solution.trap([4,2,0,3,2,5]))

class Solution {
    func trap(_ height: [Int]) -> Int {
        var leftHighest = [Int](repeating: 0, count: height.count)
        var rightHighest = [Int](repeating: 0, count: height.count)
        
        var i = 1
        while i < height.count {
            leftHighest[i] = max(leftHighest[i - 1], height[i - 1])
            i += 1
        }
        
        i = height.count - 2
        while i >= 0 {
            rightHighest[i] = max(rightHighest[i + 1], height[i + 1])
            i -= 1
        }
        
        var amount = 0
        i = 0
        var minHighest = 0
        while i < height.count {
            minHighest = min(leftHighest[i], rightHighest[i])
            if minHighest > height[i] {
                amount += minHighest - height[i]
            }
            
            i += 1
        }
        
        return amount
    }
}
