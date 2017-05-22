//
//  Notes.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

// Views: 1
// Controllers: 1
// Models: Players() & AI()
// --Protocols: Actions for players and AI to share


//Combinations of wins possibility.
// out of array of [0,1,2
//                  3,4,5
//                  6,7,8]
// Posibilities: 
// Rows:     (0,1,2) (3,4,5) (6,7,8)
// Colums:   (0,3,6) (1,4,7) (2,5,8)
// Diagonals:   (0,4,8) (2,4,6)
//

//To simplify matters, We can focus on the AI algorithm of never make a losing nextMove and just randomize the slots to where the move won't lose. Maybe, not an optimize move, but a never losing move.  

//Player & AI should have an array of Int to test the compination against the winning possibility after each turn to see if they win
//To avoid any shared data problems, there will be wait methods to prevent a player making a turn while ai is making a turn


//Fortunately, when I was in 8th grade I sat through science class and figured out the game of Tic Tac Toe, I do not know exactly what the optimal move, but I've never lost unless I chose to since then. I will be making any algorithm base on my knowledge and avoid using little to no resources online since I do not want to kill my logic early on and hide my weakness or strengths in solving problems.

//My gameAlgorithm would go as such
//Since players will always go first
//To win player must make atleast 3 alternate moves or AI must make 3 alternate moves
//It goes as follows:
//--Step 1
//Case 1: If players go anywhere on [0,2,6,8] AI must go to [4]
//Case 2: If players go to [4] AI must go to [0,2,6,8]
//Case 3: If Player -> [1,3,5,7] AI -> Anywhere
//--Step 2
//Case 1: Board is occupied by AI on 4 and Player on any of the corner
//

//-------------------------POST PROJECT UPDATES ------------------------
// I've decided to come back to this project on May 22, 2017 to update the project using an algorithm call minimax.
// In addition, I am turning the project from more of an object oriented design to Protocol-Oriented-Design more of the Apple's way of doing thing
//The project is not whole, but near completion, Algorithm is partially working properly as it does its recurssion, but is not accurately making the optimal move yet. Therefore, functions for updating scores and what not is not updated. 





