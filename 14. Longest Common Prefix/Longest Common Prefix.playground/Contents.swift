//Runtime: 48 ms, faster than 30.45% of Swift online submissions for Longest Common Prefix.
//Memory Usage: 14 MB, less than 97.84% of Swift online submissions for Longest Common Prefix.

import UIKit

let solution = Solution()
let strs = ["dog","racecar","car"]
print(solution.longestCommonPrefix(strs))

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count <= 0 {
            return ""
        }
        
        var commonString = ""
        loop: for i in 0 ..< strs[0].count {
            let c = strs[0][strs[0].index(strs[0].startIndex, offsetBy: i)]
            
            for j in 1 ..< strs.count {
                if i >= strs[j].count || c != strs[j][strs[j].index(strs[j].startIndex, offsetBy: i)] {
                    break loop
                }
            }
            
            commonString.append(c)
        }
        
        return commonString
    }
}
