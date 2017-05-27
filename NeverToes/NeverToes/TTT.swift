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
                if (board.getSpace(row: i, column: j) == -1){
                    board.setSpace(value: currentPlayer, row: i, column: j)
                    let moveValue = try minimax(board: &board, aiTurn: false, depth: 0)
                    board.removeSpace(value: -1, row: i, column: j)
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
            if(gameOver()){
                return (10 - depth)
            }else{
                var best: Int = -10000
                for i in 0...2{
                    for j in 0...2{
                        if(board.getSpace(row: i, column: j) < 0){
                            board.setSpace(value: currentPlayer, row: i, column: j)
                            let sbest = max(best, try minimax(board: &board, aiTurn: true, depth: depth+1))
                            board.removeSpace(value: -1, row: i, column: j)
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
            if(gameOver()){
                print(-10 + depth)
                return (-10 + depth)
            }else{
                var best: Int = 100000
                for i in 0...2{
                    for j in 0...2{
                        if(board.getSpace(row: i, column: j) < 0){
                            board.setSpace(value: currentPlayer, row: i, column: j)
                            let sbest = min(best,try minimax(board: &board, aiTurn: true, depth: depth+1))
                            board.removeSpace(value: -1, row: i, column: j)
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
    
    
    func gameOver() -> Bool {
        if (board.getSpace(row: 0, column: 1) == board.getSpace(row: 0, column: 2) && board.getSpace(row: 0, column: 2) == board.getSpace(row: 0, column: 2)){return true}
        else if (board.getSpace(row: 1, column: 0) == board.getSpace(row: 1, column: 1) && board.getSpace(row: 1, column: 1) == board.getSpace(row: 1, column: 2)){return true}
        else if (board.getSpace(row: 2, column: 0) == board.getSpace(row: 2, column: 1) && board.getSpace(row: 2, column: 1) == board.getSpace(row: 2, column: 2)){return true}
        else if (board.getSpace(row: 0, column: 0) == board.getSpace(row: 1, column: 0) && board.getSpace(row: 1, column: 0) == board.getSpace(row: 2, column: 0)){return true}
        else if (board.getSpace(row: 0, column: 0) == board.getSpace(row: 1, column: 1) && board.getSpace(row: 1, column: 1) == board.getSpace(row: 2, column: 1)){return true}
        else if (board.getSpace(row: 0, column: 2) == board.getSpace(row: 1, column: 2) && board.getSpace(row: 1, column: 2) == board.getSpace(row: 2, column: 2)){return true}
        else if (board.getSpace(row: 0, column: 0) == board.getSpace(row: 1, column: 1) && board.getSpace(row: 1, column: 1) == board.getSpace(row: 2, column: 2)){return true}
        else if (board.getSpace(row: 0, column: 2) == board.getSpace(row: 1, column: 1) && board.getSpace(row: 1, column: 1) == board.getSpace(row: 2, column: 0)){return true}
        else{ return false}
    }

    
    
    
    
}
