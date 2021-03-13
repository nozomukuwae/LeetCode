//Runtime: 8 ms, faster than 96.33% of Swift online submissions for Longest Common Prefix.
//Memory Usage: 14.6 MB, less than 32.18% of Swift online submissions for Longest Common Prefix.

import UIKit

let solution = Solution()
let strs = ["dog","racecar","car"]
print(solution.longestCommonPrefix(strs))

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard var shortestWord = strs.min (by: { $0.count < $1.count }) else {
            return ""
        }
        
        for str in strs {
            while !str.hasPrefix(shortestWord) && shortestWord.count > 0 {
                shortestWord.removeLast()
            }
        }
                
        return shortestWord
    }
}
