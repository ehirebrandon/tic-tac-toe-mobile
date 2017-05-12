//
//  Action.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit


protocol StartGame{
    func play(openMove: UIButton, openSlot: Int)
    func makeWin(client: String, currentPlayer: String)
    func makeDouble(board: [String])
    func makeSingle()
    func aiMoves(playerMove: Int) throws
    func checkSelect()-> Bool
    func clearBoard()
    func scoreReset()
}

