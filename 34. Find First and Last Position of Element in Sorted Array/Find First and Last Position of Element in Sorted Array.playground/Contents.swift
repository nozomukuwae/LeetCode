//Runtime: 44 ms, faster than 96.52% of Swift online submissions for Find First and Last Position of Element in Sorted Array.
//Memory Usage: 15.4 MB, less than 15.19% of Swift online submissions for Find First and Last Position of Element in Sorted Array.

// Time complexity: O(logN)
// Space complexity: O(1)

import Foundation

let solution = Solution()
print(solution.searchRange([5,7,7,8,8,10], 8))
print(solution.searchRange([5,7,7,8,8,10], 6))
print(solution.searchRange([], 0))
print(solution.searchRange([1], 1))
print(solution.searchRange([1,2,2,3,4,4,4], 4))

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = nums.count - 1
        var mid: Int!
        var firstTargetIndex = -1
        
        // Loop until finding the first target
        while start <= end {
            mid = (start + end) / 2
            
            if nums[mid] < target {
                start = mid + 1
            } else if nums[mid] > target {
                end = mid - 1
            } else { // nums[mid] == target
                if mid == 0 || nums[mid - 1] != target {
                    firstTargetIndex = mid
                    break
                } else {
                    end = mid - 1
                }
            }
        }
        
        if firstTargetIndex < 0 {
            return [-1, -1]
        }
        
        start = firstTargetIndex
        end = nums.count - 1

        // Loop until finding the last target
        while start <= end {
            mid = (start + end) / 2
            
            if nums[mid] < target {
                start = mid + 1
            } else if nums[mid] > target {
                end = mid - 1
            } else { // nums[mid] == target
                if mid == nums.count - 1 || nums[mid + 1] != target {
                    return [firstTargetIndex, mid]
                } else {
                    start = mid + 1
                }
            }
        }
        
        return [firstTargetIndex, firstTargetIndex]
    }
}
