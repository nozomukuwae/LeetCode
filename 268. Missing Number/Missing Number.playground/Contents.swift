//Time Limit Exceeded

// Time complexity: O(N^2)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.missingNumber([3,0,1])) // 2
print(solution.missingNumber([0,1])) // 2
print(solution.missingNumber([9,6,4,2,3,5,7,0,1])) // 8
print(solution.missingNumber([0])) // 1

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        return (0 ... nums.count).first { !nums.contains($0) }!
    }
}
