//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Climbing Stairs.
//Memory Usage: 13.9 MB, less than 55.68% of Swift online submissions for Climbing Stairs.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.climbStairs(2))
print(solution.climbStairs(3))

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1}
        
        var steps: [Int] = [1, 2]
        for i in 2 ..< n {
            steps.append(steps[i - 2] + steps[i - 1])
        }
        
        return steps[n - 1]
    }
}
