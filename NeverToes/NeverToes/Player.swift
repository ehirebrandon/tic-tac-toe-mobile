//
//  Player.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit

class Player{
    
    var artificial: Bool = false
    
    var alias: Int
    
    var opponent: Player?
    
    var win: Int
    var loss: Int
    
    init(alias: Int, win: Int, loss: Int){
        self.alias = alias
        self.win = win
        self.loss = loss
    }


    
}
