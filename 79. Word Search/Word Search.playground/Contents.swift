//Runtime: 3208 ms, faster than 18.94% of Swift online submissions for Word Search.
//Memory Usage: 14.8 MB, less than 43.79% of Swift online submissions for Word Search.

// Time complexity: O(NMW) where N = length of board, M = length of string in board, W = length of word
// Space complexity: O(max(N, C)) where C = number of corresponding characters in board

import Foundation

let solution = Solution()

print(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
print(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
print(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let charArray = Array(word)
        var history = [[Int]: Bool]()

        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                if board[i][j] == charArray[0] {
                    if charArray.count <= 1 { return true }
                    
                    history[[j, i]] = true
                    if exist(board, charArray, 1, j - 1, i, &history) { return true }
                    if exist(board, charArray, 1, j + 1, i, &history) { return true }
                    if exist(board, charArray, 1, j, i - 1, &history) { return true }
                    if exist(board, charArray, 1, j, i + 1, &history) { return true }
                    history[[j, i]] = nil
                }
            }
        }
        
        return false
    }
    
    func exist(_ board: [[Character]], _ charArray: [Character], _ charIndex: Int, _ x: Int, _ y: Int, _ history: inout [[Int]: Bool]) -> Bool {
        if x < 0 { return false }
        if x >= board[0].count { return false }
        if y < 0 { return false }
        if y >= board.count { return false }
        if history[[x, y]] != nil { return false }

        if board[y][x] == charArray[charIndex] {
            if charIndex >= charArray.count - 1 { return true }

            history[[x, y]] = true
            if exist(board, charArray, charIndex + 1, x - 1, y, &history) { return true }
            if exist(board, charArray, charIndex + 1, x + 1, y, &history) { return true }
            if exist(board, charArray, charIndex + 1, x, y - 1, &history) { return true }
            if exist(board, charArray, charIndex + 1, x, y + 1, &history) { return true }
            history[[x, y]] = nil
        }
            
        return false
    }
}
