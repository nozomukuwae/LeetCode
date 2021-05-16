//Runtime: 96 ms, faster than 94.13% of Swift online submissions for Longest Palindromic Substring.
//Memory Usage: 14.3 MB, less than 82.39% of Swift online submissions for Longest Palindromic Substring.

// Time complexity: O(N^2)
// Space complexity: O(N^2)

import Foundation

let solution = Solution()
print(solution.longestPalindrome("babad"))
print(solution.longestPalindrome("cbbd"))
print(solution.longestPalindrome("a"))
print(solution.longestPalindrome("ac"))

print(solution.longestPalindrome("babab"))
print(solution.longestPalindrome("cbbc"))
print(solution.longestPalindrome("aacabdkacaa")) // aca

class Solution {
    typealias CustomRange = (start: Int, end: Int)
    
    func isLonger(_ range1: CustomRange, _ range2: CustomRange) -> Bool {
        return range1.end - range1.start > range2.end - range2.start
    }
    
    func isPalindrome(_ start: Int, _ end: Int, _ cArray: [Character]) -> Bool {
        var i = start, j = end
        while i < j {
            if cArray[i] != cArray[j] { return false }
            i += 1
            j -= 1
        }
        
        return true
    }
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        let cArray = Array(s)

        var longestIncludingMe = CustomRange(0, 0)
        var longestEver = CustomRange(0, 0)
        
        if cArray[1] == cArray[0] {
            longestIncludingMe.end = 1
            longestEver.end = 1
        } else {
            longestIncludingMe = CustomRange(1, 1)
        }
        
        for i in 2 ..< cArray.count {
            if longestIncludingMe.start > 0 && cArray[i] == cArray[longestIncludingMe.start - 1] {
                longestIncludingMe = CustomRange(longestIncludingMe.start - 1, i)

                if isLonger(longestIncludingMe, longestEver) {
                    longestEver = longestIncludingMe
                }
            } else {
                // Re-calculate the longest palindrome including i
                var j = longestIncludingMe.start
                while j < i {
                    if cArray[j] == cArray[i] {
                        if isPalindrome(j + 1, i - 1, cArray) {
                            longestIncludingMe = CustomRange(j, i)
                            if isLonger(longestIncludingMe, longestEver) {
                                longestEver = longestIncludingMe
                            }
                            break
                        }
                    }
                    
                    j += 1
                }
                
                if j >= i {
                    longestIncludingMe = CustomRange(i, i)
                }
            }
        }

        return String(cArray[longestEver.start ... longestEver.end])
    }
}
