//
//  Game.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/11/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit


class Game{
    
    var ai: AI?
    var player: Player?
    
    required init(ai: AI, player: Player){
        self.ai = ai
        self.player = player
    }
    
}


