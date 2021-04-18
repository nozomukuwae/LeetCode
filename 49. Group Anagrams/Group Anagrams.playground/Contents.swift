//Runtime: 168 ms, faster than 41.90% of Swift online submissions for Group Anagrams.
//Memory Usage: 18.1 MB, less than 30.57% of Swift online submissions for Group Anagrams.

// Time complexity: O(NMlogM) where M = length of the longest string
// Space complexity: O(NM)

import Foundation

let solution = Solution()
print(solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
print(solution.groupAnagrams([""]))
print(solution.groupAnagrams(["a"]))

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[String.Element]: [String]]()
        var sortedStr: [String.Element]! = nil
        
        for i in 0 ..< strs.count {
            sortedStr = strs[i].sorted()
            
            if dict[sortedStr] != nil {
                dict[sortedStr]!.append(strs[i])
            } else {
                dict[sortedStr] = [strs[i]]
            }
        }
        
        return dict.map { $1 }
    }
}
