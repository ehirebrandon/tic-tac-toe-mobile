//
//  Minimax.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/15/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit

protocol Minimax{
     func minimax(board: inout GameBoard, aiTurn: Bool, depth: Int)throws -> Int
}
    

