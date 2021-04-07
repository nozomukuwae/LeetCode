//Runtime: 44 ms, faster than 96.52% of Swift online submissions for Find First and Last Position of Element in Sorted Array.
//Memory Usage: 15 MB, less than 68.67% of Swift online submissions for Find First and Last Position of Element in Sorted Array.

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
        var firstIndex = -1
        var lastIndex = -1
        
        for i in 0 ..< nums.count {
            if nums[i] == target {
                if firstIndex < 0 {
                    firstIndex = i
                } else {
                    lastIndex = i
                }
            } else if nums[i] > target {
                break
            }
        }
        
        if lastIndex < 0 && firstIndex >= 0 {
            return [firstIndex, firstIndex]
        } else {
            return [firstIndex, lastIndex]
        }
    }
}
