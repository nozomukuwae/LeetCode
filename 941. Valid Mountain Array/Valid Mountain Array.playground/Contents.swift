//Runtime: 208 ms, faster than 87.28% of Swift online submissions for Valid Mountain Array.
//Memory Usage: 14.1 MB, less than 87.86% of Swift online submissions for Valid Mountain Array.

// Time complexity: O(N)
// Space complexity: O(1)

import Foundation

let solution = Solution()
print(solution.validMountainArray([2,1]))
print(solution.validMountainArray([3,5,5]))
print(solution.validMountainArray([0,3,2,1]))

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        var i = 1
        while i < arr.count && arr[i - 1] < arr[i] {
            i += 1
        }
        
        if i == 1 || i == arr.count {
            return false
        }
        
        while i < arr.count && arr[i - 1] > arr[i] {
            i += 1
        }
        
        return (i == arr.count)
    }
}
