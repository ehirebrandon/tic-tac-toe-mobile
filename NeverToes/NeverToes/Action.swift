//
//  Action.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation

protocol Action {
    // AI & Players should be able to both do this
    // Set a move
    func setMove() throws
    // Have an alias
    func setAlias()
    // Keep count of win and loses
    func updateScore()
    // wait for other player to finish turn
    func wait()
    
}

protocol startGame{
    func play()
}
