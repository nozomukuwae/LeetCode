//Runtime: 4 ms, faster than 82.23% of Swift online submissions for Letter Combinations of a Phone Number.
//Memory Usage: 14 MB, less than 97.11% of Swift online submissions for Letter Combinations of a Phone Number.

// Time complexity: O(N * 4^N)
// Space complexity: O(N)

// Output array is ignored to count space compexity.

import Foundation

let solution = Solution()

print(solution.letterCombinations("23"))
print(solution.letterCombinations(""))
print(solution.letterCombinations("2"))

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        
        let digitsArray = Array(digits)
        var combinations = digitToCandidates[digitsArray[0]]!
        createCombinations(digitsArray, 1, &combinations)

        return combinations
    }
    
    func createCombinations(_ digits: [Character], _ index: Int, _ combinations: inout [String]) {
        guard index < digits.count else { return }
        
        let candidates = digitToCandidates[digits[index]]!
        copyElements(&combinations, candidates.count)
        
        for i in 0 ..< combinations.count {
            combinations[i].append(candidates[i % candidates.count])
        }
        
        createCombinations(digits, index + 1, &combinations)
    }
    
    func copyElements(_ array: inout [String], _ count: Int) {
        if count <= 1 { return }
        
        var i = 0
        let countAfterCopy = array.count * count
        
        while i < countAfterCopy {
            for _ in 1 ..< count {
                array.insert(array[i], at: i)
            }
            i += count
        }
    }
    
    let digitToCandidates: [Character: [String]] = [
        "2": ["a","b","c"],
        "3": ["d","e","f"],
        "4": ["g","h","i"],
        "5": ["j","k","l"],
        "6": ["m","n","o"],
        "7": ["p","q","r","s"],
        "8": ["t","u","v"],
        "9": ["w","x","y","z"]
    ]
}
