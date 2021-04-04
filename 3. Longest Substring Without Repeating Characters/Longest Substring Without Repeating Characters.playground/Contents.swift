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
        let charArray = Array(s)
        var tempChars = [Character]()
        var maxSubstringLength = 0
        
        var i = 0
        while i < charArray.count {
            if let index = tempChars.lastIndex(of: charArray[i]) {
                maxSubstringLength = max(maxSubstringLength, tempChars.count)
                
                if tempChars.count - index == 1 {
                    tempChars.removeAll()
                    tempChars.append(charArray[i])
                    i += 1
                } else {
                    i -= tempChars.count - index - 1
                    tempChars.removeAll()
                }
            } else {
                tempChars.append(charArray[i])
                i += 1
            }
        }
        
        return max(maxSubstringLength, tempChars.count)
    }
}
