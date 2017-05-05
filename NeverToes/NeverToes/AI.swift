//
//  AI.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation

struct AI{
    var alias: String
    var win: Int?
    var lose: Int?
    
    init(alias: String, win: Int, lose: Int){
        self.alias = alias
        self.win = win
        self.lose = lose
    }
    
}
