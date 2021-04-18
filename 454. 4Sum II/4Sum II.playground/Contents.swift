//Time Limit Exceeded

// Time complexity: O(N^4)
// Space complexity: O(N^4)

import Foundation

let solution = Solution()
print(solution.fourSumCount([1,2],[-2,-1],[-1,2],[0,2]))
print(solution.fourSumCount([0],[0],[0],[0]))

class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var count = 0
        
        for i in 0 ..< nums1.count {
            for j in 0 ..< nums2.count {
                for k in 0 ..< nums3.count {
                    for l in 0 ..< nums4.count {
                        if nums1[i] + nums2[j] + nums3[k] + nums4[l] == 0 {
                            count += 1
                        }
                    }
                }
            }
        }
        
        return count
    }
}
