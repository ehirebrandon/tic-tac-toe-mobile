//
//  TTT.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/19/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit

struct RowColumn{
    var row: Int?
    var column: Int?
    
    init(row: Int, column: Int){
        self.row = row
        self.column = column
    }
}

class TTT: Game, TTTMoves, TTTCheck, Minimax{
    
    var board = GameBoard()
    var currentPlayer = -1
    var currentAI = -1
    
    func aiBestMove()throws -> RowColumn{
        var bestValue = -10000
        var bestMove = RowColumn(row: -1, column: -1)
        for i in 0...2{
            for j in 0...2{
                if (board.getSpace(row: i, column: j) < 0){
                    board.setSpace(value: currentAI, row: i, column: j)
                    let moveValue = try minimax(board: &board, aiTurn: false, depth: 0)
                    board.removeSpace(row: i, column: j)
                    if (moveValue > bestValue){
                        bestMove.row = i
                        bestMove.column = j
                        bestValue = moveValue
                    }
                }
            }
        }
        return bestMove
    }
    func minimax(board: inout GameBoard, aiTurn: Bool, depth: Int)throws -> Int {
        if(aiTurn){
            if(gameOver(player: (player?.alias)!)){
                return (depth - 10)
            }else{
                var maxBest: Int = -10000
                for i in 0...2{
                    for j in 0...2{
                        if(board.getSpace(row: i, column: j) < 0){
                            board.setSpace(value: currentAI, row: i, column: j)
                            maxBest = max(maxBest, try minimax(board: &board, aiTurn: !aiTurn, depth: depth+1))
                            board.removeSpace(row: i, column: j)
                        }
                    }
                }
                return maxBest
            }
        }
        else if(!aiTurn){
            if(gameOver(player: (ai?.alias)!)){
                return (-10 + depth)
            }else{
                var minBest: Int = 10000
                for i in 0...2{
                    for j in 0...2{
                        if(board.getSpace(row: i, column: j) < 0){
                            board.setSpace(value: currentPlayer, row: i, column: j)
                            minBest = min(minBest, try minimax(board: &board, aiTurn: !aiTurn, depth: depth+1))
                            board.removeSpace(row: i, column: j)
                        }
                    }
                }
                return minBest
            }
        }else{
            return 0
        }
    }
    
    
    func gameOver(player: Int) -> Bool{

        if (board.getSpace(row: 0, column: 0) == player && board.getSpace(row: 0, column: 1) == player && board.getSpace(row: 0, column: 2) == player){
            print("true")
            return true
        }
        else if (board.getSpace(row: 1, column: 0) == player && board.getSpace(row: 1, column: 1) == player && board.getSpace(row: 1, column: 2) == player){
            print("true")
            return true
        }
        else if (board.getSpace(row: 2, column: 0) == player && board.getSpace(row: 2, column: 1) == player && board.getSpace(row: 2, column: 2) == player){
            print("true")
            return true
        }
        else if (board.getSpace(row: 0, column: 0) == player && board.getSpace(row: 1, column: 0) == player && board.getSpace(row: 2, column: 0) == player){
            print("true")
            return true
        }
        else if (board.getSpace(row: 0, column: 1) == player && board.getSpace(row: 1, column: 1) == player && board.getSpace(row: 2, column: 1) == player){
            print("true")
            return true
        }
        else if (board.getSpace(row: 0, column: 2) == player && board.getSpace(row: 1, column: 2) == player && board.getSpace(row: 2, column: 2) == player){
            print("true")
            return true
        }
        else if (board.getSpace(row: 0, column: 0) == player && board.getSpace(row: 1, column: 1) == player && board.getSpace(row: 2, column: 2) == player){
            print("true")
            return true
        }
        else if (board.getSpace(row: 0, column: 2) == player && board.getSpace(row: 1, column: 1) == player && board.getSpace(row: 2, column: 0) == player){
            print("true")
            return true
        }else{
            print("fools")
            return false
        }
    }
    
    
    
    
    
    
}
