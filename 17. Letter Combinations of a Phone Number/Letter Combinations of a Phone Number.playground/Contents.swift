//Runtime: 4 ms, faster than 82.23% of Swift online submissions for Letter Combinations of a Phone Number.
//Memory Usage: 14.7 MB, less than 16.94% of Swift online submissions for Letter Combinations of a Phone Number.

// Time complexity: O(4^N)
// Space complexity: O(4^(N-1))

// Output array is ignored to count space compexity.

import Foundation

let solution = Solution()

print(solution.letterCombinations("23"))
print(solution.letterCombinations(""))
print(solution.letterCombinations("2"))

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        
        let candidates = digits.map { digitToCandidates[$0]! }
        var combinations = [String]()
        createCombinations(candidates, 0, "", &combinations)
        
        return combinations
    }
    
    func createCombinations(_ candidates: [String], _ index: Int, _ carry: String, _ combinations: inout [String]) {
        guard index < candidates.count else {
            combinations.append(carry)
            return
        }
        
        for c in candidates[index] {
            createCombinations(candidates, index + 1, carry + String(c), &combinations)
        }
    }

    let digitToCandidates: [Character: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]
}
