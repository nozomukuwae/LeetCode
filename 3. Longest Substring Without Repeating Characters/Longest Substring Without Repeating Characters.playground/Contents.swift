//Runtime: 248 ms, faster than 21.97% of Swift online submissions for Longest Substring Without Repeating Characters.
//Memory Usage: 14.9 MB, less than 46.85% of Swift online submissions for Longest Substring Without Repeating Characters.

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
        let charArray = Array(s)
        var tempChars = [Character]()
        var maxSubstringLength = 0
        
        var end = 0
        while end < charArray.count {
            if let index = tempChars.lastIndex(of: charArray[end]) {
                maxSubstringLength = max(maxSubstringLength, tempChars.count)
                tempChars.removeFirst(index + 1)
            }
            
            tempChars.append(charArray[end])
            end += 1
        }
        
        return max(maxSubstringLength, tempChars.count)
    }
}
