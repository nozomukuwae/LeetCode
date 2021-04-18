//Runtime: 752 ms, faster than 5.71% of Swift online submissions for 4Sum II.
//Memory Usage: 14.2 MB, less than 97.14% of Swift online submissions for 4Sum II.

// Time complexity: O(N^4)
// Space complexity: O(N^2)

import Foundation

let solution = Solution()
print(solution.fourSumCount([1,2],[-2,-1],[-1,2],[0,2]))
print(solution.fourSumCount([0],[0],[0],[0]))

class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var firstSumDict = [Int: Int]()
        
        var i = 0
        var j: Int! = nil
        while i < nums1.count {
            j = 0
            while j < nums2.count {
                firstSumDict[nums1[i] + nums2[j], default: 0] += 1
                j += 1
            }
            
            i += 1
        }
        
        var secondSumDict = [Int: Int]()
        i = 0
        while i < nums3.count {
            j = 0
            while j < nums4.count {
                secondSumDict[nums3[i] + nums4[j], default: 0] += 1
                j += 1
            }
            
            i += 1
        }

        return firstSumDict.reduce(0) { (result, arg1) -> Int in
            return result + arg1.value * secondSumDict[-arg1.key, default: 0]
        }
    }
}
