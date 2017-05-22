//
//  AI.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit

class AI: Player{
    
    override init(alias: Int, win: Int, loss: Int){
        super.init(alias: alias, win: win, loss: loss)
        artificial = true
    }
    
}
