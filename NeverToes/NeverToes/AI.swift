//
//  AI.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit

struct AI{
    var alias: String?
    
    var win: Int{
        get{
            return self.win
        }
        set{
        }
    }
    var loss: Int{
        get{
            return self.loss
        }
        set{
        }
    }
    
    init(alias: String, win: Int, loss: Int){
        self.alias = alias
        self.win = win
        self.loss = loss
    }

}
