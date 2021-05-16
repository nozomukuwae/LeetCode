//Runtime: 0 ms, faster than 100.00% of Swift online submissions for Unique Paths.
//Memory Usage: 14.2 MB, less than 9.14% of Swift online submissions for Unique Paths.

// Time complexity: O(NM)
// Space complexity: O(NM)

import Foundation

let solution = Solution()
print(solution.uniquePaths(3, 7))
print(solution.uniquePaths(3, 2))
print(solution.uniquePaths(7, 3))
print(solution.uniquePaths(3, 3))

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var paths = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
        
        for i in 1 ..< n {
            for j in 1 ..< m {
                paths[j][i] = paths[j][i - 1] + paths[j - 1][i]
            }
        }

        return paths[m - 1][n - 1]
    }
}
