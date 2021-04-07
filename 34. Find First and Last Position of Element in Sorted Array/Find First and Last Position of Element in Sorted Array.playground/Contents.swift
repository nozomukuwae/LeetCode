//Runtime: 48 ms, faster than 65.51% of Swift online submissions for Find First and Last Position of Element in Sorted Array.
//Memory Usage: 15.1 MB, less than 50.63% of Swift online submissions for Find First and Last Position of Element in Sorted Array.

// Time complexity: O(N)
// Space complexity: O(1)

import Foundation

let solution = Solution()
print(solution.searchRange([5,7,7,8,8,10], 8))
print(solution.searchRange([5,7,7,8,8,10], 6))
print(solution.searchRange([], 0))
print(solution.searchRange([1], 1))

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = nums.count - 1
        
        while start <= end {
            if nums[(start + end) / 2] < target {
                start = (start + end) / 2 + 1
            } else if nums[(start + end) / 2] > target {
                end = (start + end) / 2 - 1
            } else { // nums[mid] == target
                var i = (start + end) / 2 - 1
                while i >= 0 && nums[i] == target {
                    i -= 1
                }
                
                var j = (start + end) / 2 + 1
                while j < nums.count && nums[j] == target {
                    j += 1
                }
                
                return [i + 1, j - 1]
            }
        }
        
        return [-1, -1]
    }
}
