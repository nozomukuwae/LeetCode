//Runtime: 4 ms, faster than 88.65% of Swift online submissions for Valid Parentheses.
//Memory Usage: 14.2 MB, less than 80.27% of Swift online submissions for Valid Parentheses.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.isValid("()"))
print(solution.isValid("()[]{}"))
print(solution.isValid("(]"))
print(solution.isValid("([)]"))
print(solution.isValid("{[]}"))

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for c in s {
            switch c {
            case ")":
                if stack.popLast() != "(" { return false }
            case "]":
                if stack.popLast() != "[" { return false }
            case "}":
                if stack.popLast() != "{" { return false }
            default: // Open parentheses
                stack.append(c)
            }
        }
        
        return stack.isEmpty
    }
}
