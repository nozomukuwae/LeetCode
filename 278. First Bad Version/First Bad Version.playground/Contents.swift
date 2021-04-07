//Runtime: 20 ms, faster than 77.39% of Swift online submissions for First Bad Version.
//Memory Usage: 13.9 MB, less than 54.77% of Swift online submissions for First Bad Version.

// Time complexity: O(logN)
// Space complexity: O(1)

import Foundation

let solution1 = Solution(bad: 4)
print(solution1.firstBadVersion(5))
let solution2 = Solution(bad: 1)
print(solution2.firstBadVersion(1))

class VersionControl {
    init(bad: Int) {
        self.firstBadVersionStored = bad
    }
    
    private let firstBadVersionStored: Int
    
    func isBadVersion(_ version: Int) -> Bool {
        return version >= firstBadVersionStored
    }
}

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var start = 1
        var end = n
        var mid: Int!
        
        while start < end {
            mid = (start + end) / 2

            if isBadVersion(mid) {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        return start
    }
}
