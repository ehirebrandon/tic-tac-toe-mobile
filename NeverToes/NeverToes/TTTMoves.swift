//
//  GameMoves.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/19/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation

protocol TTTMoves{
    
    //1. Find the best move and return it for use of setting space
    func aiBestMove()throws -> RowColumn
  
    //3. Find out which alias is the winner
    //func getWinner() -> Player
    
    
}

protocol TTTCheck {
    //2. Find out of if game is over
    func gameOver() -> Bool
}
