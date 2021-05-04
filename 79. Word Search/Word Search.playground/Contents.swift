//Runtime: 4152 ms, faster than 10.24% of Swift online submissions for Word Search.
//Memory Usage: 14.6 MB, less than 63.35% of Swift online submissions for Word Search.

// Time complexity: O(NMW) where N = length of board, M = length of string in board, W = length of word
// Space complexity: O(max(N, C)) where C = number of corresponding characters in board

import Foundation

let solution = Solution()

print(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
print(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
print(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let firstChar = word[word.startIndex]
        var history = [[Int]: Void]()
        
        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                if board[i][j] == firstChar {
                    if word.count <= 1 { return true }

                    history[[j, i]] = ()
                    if exist(board, word, 1, j - 1, i, &history) { return true }
                    if exist(board, word, 1, j + 1, i, &history) { return true }
                    if exist(board, word, 1, j, i - 1, &history) { return true }
                    if exist(board, word, 1, j, i + 1, &history) { return true }
                    history[[j, i]] = nil
                }
            }
        }
        
        return false
    }
    
    func exist(_ board: [[Character]], _ word: String, _ charIndex: Int, _ x: Int, _ y: Int, _ history: inout [[Int]: Void]) -> Bool {
        if x < 0 || x >= board[0].count || y < 0 || y >= board.count || history[[x, y]] != nil {
            return false
        }

        if board[y][x] == word[word.index(word.startIndex, offsetBy: charIndex)] {
            if charIndex >= word.count - 1 { return true }

            history[[x, y]] = ()
            if exist(board, word, charIndex + 1, x - 1, y, &history) { return true }
            if exist(board, word, charIndex + 1, x + 1, y, &history) { return true }
            if exist(board, word, charIndex + 1, x, y - 1, &history) { return true }
            if exist(board, word, charIndex + 1, x, y + 1, &history) { return true }
            history[[x, y]] = nil
        }

        return false
    }
}
