//Runtime: 208 ms, faster than 87.28% of Swift online submissions for Valid Mountain Array.
//Memory Usage: 14.3 MB, less than 76.30% of Swift online submissions for Valid Mountain Array.

// Time complexity: O(N)
// Space complexity: O(1)

import Foundation

let solution = Solution()
print(solution.validMountainArray([2,1]))
print(solution.validMountainArray([3,5,5]))
print(solution.validMountainArray([0,3,2,1]))

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        var isIncreasing = true
        
        for i in 1 ..< arr.count {
            switch isIncreasing {
            case true:
                if arr[i - 1] < arr[i] {
                    continue
                } else if arr[i - 1] > arr[i] {
                    if i <= 1 {
                        return false
                    }
                    
                    isIncreasing = false
                } else {
                    return false
                }
            case false:
                if arr[i - 1] <= arr[i] {
                    return false
                }
            }
        }
        
        return isIncreasing ? false : true
    }
}
