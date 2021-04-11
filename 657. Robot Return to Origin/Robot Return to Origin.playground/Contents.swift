//Runtime: 32 ms, faster than 47.62% of Swift online submissions for Robot Return to Origin.
//Memory Usage: 14 MB, less than 84.13% of Swift online submissions for Robot Return to Origin.

// Time complexity: O(N)
// Space complexity: O(1)

import Foundation

let solution = Solution()
print(solution.judgeCircle("UD"))
print(solution.judgeCircle("LL"))
print(solution.judgeCircle("RRDD"))
print(solution.judgeCircle("LDRRLRUULR"))

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var x = 0, y = 0
        
        for c in moves {
            switch c {
            case "R":
                x += 1
            case "L":
                x -= 1
            case "U":
                y += 1
            case "D":
                y -= 1
            default:
                break
            }
        }

        return x == 0 && y == 0
    }
}
