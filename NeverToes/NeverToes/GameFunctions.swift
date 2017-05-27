//
//  Action.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit


protocol GameFunctions{
    
    //Sequence in play
    //1. Be able to select Cross or Circle as a player Alias
    func selectAlias(playerAlias: Int, aiAlias: Int)
    
    //4. Make the play with player turn
    func play(openMove: UIButton, row: Int, column: Int)
    
    //5. Wait for the Ai to make a move
    func waitAi()
    
    //6. Update the score board for everytime player/ai makes a play
    //func updateScoreBoard(alias: Int, win: Int, loss: Int)
    
    //7. Check For winner and pop up winner
    
}

protocol GameChecks{
    
    //2. Once Selected, check if this is the first move play
    func boardFirstMove() -> Bool
    
    //3. Then check to see if the position chosen has been occupied
    func checkSelect() -> Bool
}


protocol Resets{
    
    //Last: Reset the game
    
    func clearBoard()
    func scoreReset()
}

