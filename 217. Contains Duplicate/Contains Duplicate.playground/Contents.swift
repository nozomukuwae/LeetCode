//Runtime: 132 ms, faster than 100.00% of Swift online submissions for Contains Duplicate.
//Memory Usage: 16.8 MB, less than 30.60% of Swift online submissions for Contains Duplicate.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.containsDuplicate([1,2,3,1]))
print(solution.containsDuplicate([1,2,3,4]))
print(solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2]))

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict = [Int: Void]()
        
        for i in 0 ..< nums.count {
            if dict[nums[i]] != nil {
                return true
            }
            
            dict[nums[i]] = ()
        }
        
        return false
    }
}
