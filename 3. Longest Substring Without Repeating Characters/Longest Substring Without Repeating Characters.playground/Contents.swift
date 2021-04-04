//Runtime: 36 ms, faster than 82.25% of Swift online submissions for Longest Substring Without Repeating Characters.
//Memory Usage: 15 MB, less than 33.24% of Swift online submissions for Longest Substring Without Repeating Characters.

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
        var charDictionary = [Character : Int]()
        var maxSubstringLength = 0
        
        var start = 0
        for (end, char) in s.enumerated() {
            if let index = charDictionary[char],
               start <= index {
                maxSubstringLength = max(maxSubstringLength, end - start)
                start = index + 1
            }
            
            charDictionary[char] = end
        }
        
        return max(maxSubstringLength, s.count - start)
    }
}
