//
//  BoardMoves.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/19/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation

protocol BoardMoves{
    
    
    
    //1. Get the value of index of the board space
    func getSpace(row: Int, column: Int) -> Int
    //2. Get the index location for board space
    func getSpot(row: Int, column: Int) -> Int
    //3. Set a value for the board space at index
    mutating func setSpace(value: Int, row: Int, column: Int)
    //4. Remove a value from space at index
    mutating func removeSpace(value: Int, row: Int, column: Int)
    //5. Empty out the array of the board space
    mutating func clearBoard()
    
    
}
