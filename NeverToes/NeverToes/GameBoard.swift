//
//  GameBoard.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/19/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import Foundation
import UIKit

struct GameBoard: BoardMoves{

    var boardSpace = [-1,-2,-3,
                      -4,-5,-6,
                      -7,-8,-9]
    
    //var boardSpace: [Int] = {
    //    var tempBoard = [Int]()
    //    var isEmpty = -1
        
    //    for i in 0...2{
    //        for j in 0...2{
    //            tempBoard.append(isEmpty)
    //       }
    //   }
    //    print(tempBoard)
    //    return tempBoard
    //}()
    
    // returns value
    func getSpace(row: Int, column: Int) -> Int{
        return((boardSpace[(row*3) + column]))
    }
    
    // returns index
    func getSpot(row: Int, column: Int) -> Int{
        return(row*3 + column)
    }
    
    mutating func setSpace(value: Int, row: Int, column: Int){
        boardSpace[(row*3) + column] = value
    }
    
    mutating func removeSpace(row: Int, column: Int){
        boardSpace[(row*3) + column] = -1
    }
    
    mutating func clearBoard(){
        self.boardSpace = [Int]()
    }
    
    

    
}
