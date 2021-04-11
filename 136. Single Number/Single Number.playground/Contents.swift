//Runtime: 228 ms, faster than 9.02% of Swift online submissions for Single Number.
//Memory Usage: 14.6 MB, less than 92.71% of Swift online submissions for Single Number.

// Time complexity: O(NlogN)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.singleNumber([2,1,1]))
print(solution.singleNumber([4,1,2,1,2]))
print(solution.singleNumber([1]))
print(solution.singleNumber([-336,513,-560,-481,-174,101,-997,40,-527,-784,-283,-336,513,-560,-481,-174,101,-997,40,-527,-784,-283,354]))

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums[0]
        }
        
        let sortedArray = nums.sorted()
        
        var start = 0, end = sortedArray.count - 1
        var mid: Int!
        
        while start < end {
            mid = (start + end) / 2
            if mid % 2 == 0 {
                if sortedArray[mid] == sortedArray[mid + 1] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            } else {
                if sortedArray[mid - 1] == sortedArray[mid] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }
        
        if start % 2 == 0 {
            return sortedArray[start]
        } else {
            return sortedArray[start + 1]
        }
    }
}
