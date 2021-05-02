// Time complexity: O(NM)
// Space complexity: O(N), O(M)

import Foundation

let solution = Solution()
print(solution.minWindow("ADOBECODEBANC", "ABC"))
print(solution.minWindow("a", "a"))
print(solution.minWindow("aa", "a")) // Insufficient question description. I supposed that this returns "a", but the question supposed ""

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var map = [Character: Character]()
        for c in t {
            map[c] = c
        }
        
        let matchedChars: [Character?] = s.map { map[$0] }
        var i = 0
        while i < matchedChars.count && matchedChars[i] == nil {
            i += 1
        }
        if i >= matchedChars.count {
            return ""
        }
        
        var start = i
        var end = i
        var minStart: Int? = nil
        var minEnd: Int? = nil
        var minLength = Int.max
        var matchedIndicesMap = [Character: Int]()
        
        while end < matchedChars.count {
            if matchedChars[end] == nil {
                end += 1
                continue
            }
            
            matchedIndicesMap[matchedChars[end]!] = end
            
            if matchedIndicesMap.count == map.count {
                start = matchedIndicesMap.values.min()!
                
                if minLength > end - start + 1 {
                    minLength = end - start + 1
                    minStart = start
                    minEnd = end
                }
            }
            
            end += 1
        }
        
        if minLength < Int.max {
            return String(s[s.index(s.startIndex, offsetBy: minStart!) ... s.index(s.startIndex, offsetBy: minEnd!)])
        } else {
            return ""
        }
    }
}
