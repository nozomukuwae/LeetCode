//Time Limit Exceeded

// Time complexity: O(N^2)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.lengthOfLongestSubstring("abcabcbb")) // 3
print(solution.lengthOfLongestSubstring("bbbbb")) // 1
print(solution.lengthOfLongestSubstring("pwwkew")) // 3
print(solution.lengthOfLongestSubstring("")) // 0
print(solution.lengthOfLongestSubstring(" ")) // 1
print(solution.lengthOfLongestSubstring("aab")) // 2
print(solution.lengthOfLongestSubstring("dvdf")) // 3

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxSubstringLength = 0
        
        var start = 0
        var end = 0
        while end < s.count {
            if let index = s[String.Index(utf16Offset: start, in: s) ..< String.Index(utf16Offset: end, in: s)]
                .lastIndex(of: s[String.Index(utf16Offset: end, in: s)]) {
                
                maxSubstringLength = max(maxSubstringLength, end - start)
                start = s.distance(from: s.startIndex, to: index) + 1
            }
            
            end += 1
        }
        
        return max(maxSubstringLength, end - start)
    }
}
