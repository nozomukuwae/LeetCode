//Runtime: 140 ms, faster than 47.81% of Swift online submissions for Majority Element.
//Memory Usage: 16 MB, less than 26.26% of Swift online submissions for Majority Element.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.majorityElement([3,2,3]))
print(solution.majorityElement([2,2,1,1,1,2,2]))

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        
        for i in 0 ..< nums.count {
            if dict[nums[i]] != nil {
                dict[nums[i]] = dict[nums[i]]! + 1
            } else {
                dict[nums[i]] = 1
            }
            
            if dict[nums[i]]! > nums.count / 2 {
                return nums[i]
            }
        }
        
        fatalError()
    }
}
