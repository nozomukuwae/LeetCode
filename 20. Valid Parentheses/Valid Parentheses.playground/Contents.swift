//Runtime: 4 ms, faster than 89.84% of Swift online submissions for Valid Parentheses.
//Memory Usage: 14.2 MB, less than 78.70% of Swift online submissions for Valid Parentheses.

import UIKit

let solution = Solution()
let s = "{[]}"
print(solution.isValid(s))

class Solution {
    func isValid(_ s: String) -> Bool {
        var unclosedList = [Character]()
        
        for str in s {
            switch str {
            case ")":
                if unclosedList.last == "(" {
                    unclosedList.removeLast()
                } else {
                    return false
                }
            case "]":
                if unclosedList.last == "[" {
                    unclosedList.removeLast()
                } else {
                    return false
                }
            case "}":
                if unclosedList.last == "{" {
                    unclosedList.removeLast()
                } else {
                    return false
                }
            default:
                unclosedList.append(str)
            }
        }
        
        if unclosedList.count > 0 {
            return false
        } else {
            return true
        }
    }
}
