//
//  GameChecks.swift
//  GameChecks
//
//  Created by Brandon Lai on 5/30/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import XCTest
@testable import NeverToes

//SUT variables
var gameUnderTest: TTT?

class GameChecks: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        gameUnderTest = TTT(ai: AI(alias: 0, win: 0, loss: 0), player: Player(alias: 1, win: 0, loss: 0))
        
        
        
    }
    
    override func tearDown() {
        //gameUnderTest = nil //Release SUT
        super.tearDown()
    }
    
    func testCheckForWinRow1() {
        //1. given
        gameUnderTest?.board.boardSpace = [0,0,0,-4,-5,-6,-7,-8,-9]
        //2. when
        let isOver = gameUnderTest?.gameOver(player: (gameUnderTest?.ai?.alias)!)
        //3. then
        XCTAssertTrue(isOver!)
    }
    func testCheckForWinRow2() {
        //1. given
        gameUnderTest?.board.boardSpace = [-1,-2,-3,0,0,0,-7,-8,-9]
        //2. when
        let isOver = gameUnderTest?.gameOver(player: (gameUnderTest?.ai?.alias)!)
        //3. then
        XCTAssertTrue(isOver!)
    }
    func testCheckForWinRow3() {
        //1. given
        gameUnderTest?.board.boardSpace = [-1,-2,-3,-4,-5,-6,0,0,0]
        //2. when
        let isOver = gameUnderTest?.gameOver(player: (gameUnderTest?.ai?.alias)!)
        //3. then
        XCTAssertTrue(isOver!)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
  

    
}
