//
//  Game.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/11/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit

class Game: Minimax{
    
    var player: Player?
    var playerAlias: UIImage? = nil
    
    var ai: AI?
    var aiAlias: UIImage? = nil
    
    var gameBoard = ["0","1","2",
                     "3","4","5",
                     "6","7","8"]
    
    
    init(ai: AI, player: Player){
        self.ai = ai
        self.player = player
    }
    
    func minimax(game board: [String], opponent: Player) -> Int {
        
        var aiTurn = true
        let gameCopy = self.gameBoard
        
        if(aiTurn){
            if(makeWin(board: gameCopy)){
                return 10
            }else{
                let newCopy = setMove(board: gameCopy)
                aiTurn = false
                return minimax(game: newCopy, opponent: self.player!)
            }
        }
        else if(!aiTurn){
            if(makeWin(board: gameCopy)){
                return -10
            }else{
                let newCopy = setMove(board: gameCopy)
                aiTurn = false
                return minimax(game: newCopy, opponent: self.ai!)
            }
            
        }else{
            return 0
        }
        
        
        
        //aiMakeMove() -> return win? if yes return score
        //else aiTurn = false and if false
        
        //if the game is over, return the score from current perspective
        
        //otherwise get a list of new game state for every possible move
        
        
        
        //create a score list
        // for each of these state add the minmax result of that state to the score list
        //if current turn return max score from the list
        //if it's opponent turn, return the minimum scores list
        
        
        
    }
    
    func makeWin(board: [String]) -> Bool{
        var aWinner = false
        for i in 0 ..< (board.count) - 1{
            if(board[i] != player?.alias && board[i] != ai?.alias){
                var gameCopy = gameBoard
                gameCopy[i] = (ai?.alias)!
                if(gameCheck(gameBoard: gameCopy)){
                    aWinner = true
                    break
                }
            }
        }
        return aWinner
    }
    
    func setMove(board: [String]) -> [String]{
        var newCopy = [String]()
        for i in 0 ..< (board.count) - 1{
            if(board[i] != player?.alias && board[i] != ai?.alias){
                var gameCopy = board
                gameCopy[i] = (ai?.alias)!
                newCopy = gameCopy
                break
            }
        }
        return newCopy
    }
    
    
    
    
    var playerExist = 0
    var aWinner = false
    for i in 0 ..< (gameBoard.count) - 1{
    if gameBoard[i] == currentPlayer!{
    playerExist += 1
    }
    }
    if playerExist < 2{
    return false
    }else{
    switch(client){
    case (ai?.alias!)!:
    for i in 0 ..< (gameBoard.count) - 1{
    if (gameBoard[i] != player?.alias && gameBoard[i] != ai?.alias){
    var gameCopy = gameBoard
    gameCopy[i] = (ai?.alias)!
    if(gameCheck(gameBoard: gameCopy)){
    aWinner = true
    break
    }
    }
    }
    break
    case (player?.alias!)!:
    for i in 0 ..< (gameBoard.count) - 1{
    if (gameBoard[i] != player?.alias && gameBoard[i] != ai?.alias){
    var gameCopy = gameBoard
    gameCopy[i] = (player?.alias)!
    if(gameCheck(gameBoard: gameCopy)){
    aWinner = true
    break
    }
    }
    }
    
    break
    default: break
    }
    }
    
    return aWinner
}

func isOver() -> Bool{
    return false
}

func win(who: Player?) -> Bool{
    return false
}

func lookForWin(client: String, currentPlayer: String?) -> Bool{
    var playerExist = 0
    var aWinner = false
    for i in 0 ..< (gameBoard.count) - 1{
        if gameBoard[i] == currentPlayer!{
            playerExist += 1
        }
    }
    if playerExist < 2{
        return false
    }else{
        switch(client){
        case (ai?.alias!)!:
            for i in 0 ..< (gameBoard.count) - 1{
                if (gameBoard[i] != player?.alias && gameBoard[i] != ai?.alias){
                    var gameCopy = gameBoard
                    gameCopy[i] = (ai?.alias)!
                    if(gameCheck(gameBoard: gameCopy)){
                        aWinner = true
                        break
                    }
                }
            }
            break
        case (player?.alias!)!:
            for i in 0 ..< (gameBoard.count) - 1{
                if (gameBoard[i] != player?.alias && gameBoard[i] != ai?.alias){
                    var gameCopy = gameBoard
                    gameCopy[i] = (player?.alias)!
                    if(gameCheck(gameBoard: gameCopy)){
                        aWinner = true
                        break
                    }
                }
            }
            
            break
        default: break
        }
    }
    
    return aWinner
}


func lookForDouble(board: [String]) -> Bool{
    for i in 0 ..< board.count - 1{
        var gameCopy = board
        if (board[i] != player?.alias && board[i] != ai?.alias){
            gameCopy[i] = (ai?.alias)!
            if (gameCheck(gameBoard: gameCopy) && reverseGameCheck(gameBoard: gameCopy)){
                return true
            }
        }
    }
    return false
}



func gameCheck(gameBoard: [String]) -> Bool{
    
    if (gameBoard[0] == gameBoard[1] && gameBoard[1] == gameBoard[2]){
        return true
    }else
        if (gameBoard[3] == gameBoard[4] && gameBoard[4] == gameBoard[5]){
            return true
        }else
            if (gameBoard[6] == gameBoard[7] && gameBoard[7] == gameBoard[8]){
                return true
            }else
                if (gameBoard[0] == gameBoard[3] && gameBoard[3] == gameBoard[6]){
                    return true
                }else
                    if (gameBoard[1] == gameBoard[4] && gameBoard[4] == gameBoard[7]){
                        return true
                    }else
                        if (gameBoard[2] == gameBoard[5] && gameBoard[5] == gameBoard[8]){
                            return true
                        }else
                            if (gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8]){
                                return true
                            }else
                                if (gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6]){
                                    return true
                                }else{
                                    return false
    }
}

func reverseGameCheck(gameBoard: [String]) -> Bool{
    
    if (gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6]){
        return true
    }else
        if (gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8]){
            return true
        }else
            if (gameBoard[2] == gameBoard[5] && gameBoard[5] == gameBoard[8]){
                return true
            }else
                if (gameBoard[1] == gameBoard[4] && gameBoard[4] == gameBoard[7]){
                    return true
                }else
                    if (gameBoard[0] == gameBoard[3] && gameBoard[3] == gameBoard[6]){
                        return true
                    }else
                        if (gameBoard[6] == gameBoard[7] && gameBoard[7] == gameBoard[8]){
                            return true
                        }else
                            if (gameBoard[3] == gameBoard[4] && gameBoard[4] == gameBoard[5]){
                                return true
                            }else
                                if (gameBoard[0] == gameBoard[1] && gameBoard[1] == gameBoard[2]){
                                    return true
                                }else{
                                    return false
    }
}



}
