//Runtime: 28 ms, faster than 95.68% of Swift online submissions for Longest Substring Without Repeating Characters.
//Memory Usage: 15.2 MB, less than 9.01% of Swift online submissions for Longest Substring Without Repeating Characters.

// Time complexity: O(N)
// Space complexity: O(N)

// Use dictionary to speed up searching in array.

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
        var charDictionary = [Character : Int]()
        var maxSubstringLength = 0
        
        var start = 0
        var end = 0
        while end < charArray.count {
            if let index = charDictionary[charArray[end]],
               start <= index {
                maxSubstringLength = max(maxSubstringLength, end - start)
                start = index + 1
            }
            
            charDictionary[charArray[end]] = end
            end += 1
        }
        
        return max(maxSubstringLength, end - start)
    }
}
