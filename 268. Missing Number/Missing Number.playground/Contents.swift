//Runtime: 248 ms, faster than 8.92% of Swift online submissions for Missing Number.
//Memory Usage: 14.6 MB, less than 31.90% of Swift online submissions for Missing Number.

// Time complexity: O(NlogN)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.missingNumber([3,0,1])) // 2
print(solution.missingNumber([0,1])) // 2
print(solution.missingNumber([9,6,4,2,3,5,7,0,1])) // 8
print(solution.missingNumber([0])) // 1

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        
        var start = 0, end = nums.count - 1
        var mid: Int!
        while start < end {
            mid = (start + end) / 2
            
            if sortedNums[mid] > mid {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        if sortedNums[end] > end {
            return end
        } else {
            return end + 1
        }
    }
}
