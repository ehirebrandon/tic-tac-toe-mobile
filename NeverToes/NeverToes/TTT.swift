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
        var bestValue = -1000
        
        var bestMove = RowColumn(row: -1, column: -1)
        
        for i in 0...2{
            for j in 0...2{
                if (board.getSpace(row: i, column: j) < 0){
                    //board.setSpace(value: currentPlayer, row: i, column: j)
                    let moveValue = try minimax(board: &board, aiTurn: false, depth: 0)
                    //board.removeSpace(row: i, column: j)
                    if (moveValue > bestValue){
                        bestMove.row = i
                        bestMove.column = j
                        bestValue = moveValue
                        board.setSpace(value: currentPlayer, row: i, column: j)
                    }
                    
                }
                
            }
        }
        
        return bestMove
    }
    
    func minimax(board: inout GameBoard, aiTurn: Bool, depth: Int)throws -> Int {
        if(aiTurn){
            if(gameOver(player: (ai?.alias)!)){
                return (10 - depth)
            }else{
                var best: Int = -10000
                for i in 0...2{
                    for j in 0...2{
                        if(board.getSpace(row: i, column: j) < 0){
                            board.setSpace(value: currentPlayer, row: i, column: j)
                            let sbest = max(best, try minimax(board: &board, aiTurn: false, depth: depth+1))
                            board.removeSpace(row: i, column: j)
                            if (sbest > best){
                                best = sbest
                            }
                        }
                    }
                }
                return best
            }
        }
        else if(!aiTurn){
            if(gameOver(player: (player?.alias)!)){
                return (-10 + depth)
            }else{
                var best: Int = 100000
                for i in 0...2{
                    for j in 0...2{
                        if(board.getSpace(row: i, column: j) < 0){
                            board.setSpace(value: currentPlayer, row: i, column: j)
                            let sbest = min(best,try minimax(board: &board, aiTurn: true, depth: depth+1))
                            board.removeSpace(row: i, column: j)
                            if (sbest < best){
                                best = sbest
                            }
                        }
                    }
                }
                return best
            }
        }else{
            return 0
        }
    }
    
    
    func gameOver(player: Int) -> Bool{
        var isTrue = false
        for i in 0...2{
            if (board.getSpace(row: i, column: 0) == player && board.getSpace(row: i, column: 1) == player && board.getSpace(row: i, column: 2) == player){
                isTrue = true
            }
        }
        for i in 0...2{
            if (board.getSpace(row: 0, column: i) == player && board.getSpace(row: 1, column: i) == player && board.getSpace(row: 2, column: i) == player){
                isTrue = true
            }
        }
        if (board.getSpace(row: 0, column: 0) == player && board.getSpace(row: 1, column: 1) == player && board.getSpace(row: 2, column: 2) == player){
            isTrue = true
        }
        if (board.getSpace(row: 0, column: 2) == player && board.getSpace(row: 1, column: 1) == player && board.getSpace(row: 2, column: 0) == player){
            isTrue = true
        }
        return isTrue
    }
    
    
    
    
    
    
}
