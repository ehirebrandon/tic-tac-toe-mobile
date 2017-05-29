//
//  ViewController.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/19/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//
import Foundation
import UIKit

class TTTController: UIViewController, GameFunctions, GameChecks, Resets{
    
    fileprivate var game: TTT?
    
    fileprivate var player: Player?
    fileprivate var playerAlias: UIImage?
    
    fileprivate var ai: AI?
    fileprivate var aiAlias: UIImage?
    
    fileprivate let imageX = UIImage(named: "X")!
    fileprivate let imageO = UIImage(named: "O")!
    
    fileprivate var flag = false
    fileprivate var gameStart = false
    
    //This can be updated by the ai/player Model
    @IBOutlet weak var aiWin: UILabel!
    @IBOutlet weak var aiLoss: UILabel!
    @IBOutlet weak var playerWin: UILabel!
    @IBOutlet weak var playerLoss: UILabel!
    
    
    // AI & Player Icons Actions & Outlets
    @IBOutlet weak var aiIcon: UIButton!
    @IBOutlet weak var playerIcon: UIButton!
    
    // Board Actions & Outlets
    @IBOutlet weak var upperLeft: UIButton!
    @IBAction func upperLeft(_ sender: Any) {
        play(openMove: upperLeft, row: 0, column: 0)
    }
    @IBOutlet weak var up: UIButton!
    @IBAction func up(_ sender: Any) {
        play(openMove: up, row: 0, column: 1)
    }
    @IBOutlet weak var upperRight: UIButton!
    @IBAction func upperRight(_ sender: Any) {
        play(openMove: upperRight, row: 0, column: 2)
    }
    @IBOutlet weak var left: UIButton!
    @IBAction func left(_ sender: Any) {
        play(openMove: left, row: 1, column: 0)
    }
    @IBOutlet weak var middle: UIButton!
    @IBAction func middle(_ sender: Any) {
        play(openMove: middle, row: 1, column: 1)
    }
    @IBOutlet weak var right: UIButton!
    @IBAction func right(_ sender: Any) {
        play(openMove: right, row: 1, column: 2)
    }
    @IBOutlet weak var bottomLeft: UIButton!
    
    @IBAction func bottomLeft(_ sender: Any) {
        play(openMove: bottomLeft, row: 2, column: 0)
    }
    @IBOutlet weak var down: UIButton!
    @IBAction func down(_ sender: Any) {
        play(openMove: down, row: 2, column: 1)
    }
    @IBOutlet weak var bottomRight: UIButton!
    @IBAction func bottomRight(_ sender: Any) {
        play(openMove: bottomRight, row: 2, column: 2)
    }
    // Select & Re-[Set/Start] buttons
    @IBOutlet weak var selectO: UIButton!
    @IBAction func selectO(_ sender: Any) {
        selectAlias(playerAlias: 0, aiAlias: 1)
    }
    @IBOutlet weak var selectX: UIButton!
    @IBAction func selectX(_ sender: Any) {
        selectAlias(playerAlias: 1, aiAlias: 0)
    }
    @IBAction func restart(_ sender: Any) {
        clearBoard()
    }
    @IBAction func reset(_ sender: Any) {
        scoreReset()
        clearBoard()
    }
    
    //MARK: START & LOADS ///////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func selectAlias(playerAlias: Int, aiAlias: Int){
        guard(gameStart) else {
        if(self.player == nil || self.ai == nil){
            print("im still nill")
            self.player = Player(alias: playerAlias, win: 0, loss: 0)
            self.ai = AI(alias: aiAlias, win: 0, loss: 0)
            self.game = TTT(ai: self.ai!, player: self.player!)
            gameStart = true
        }
        switch(playerAlias){
        case 1: self.playerAlias = imageX
        self.aiAlias = imageO
        selectO.isEnabled = false
        self.playerIcon.setImage(imageX, for: UIControlState.normal)
        self.aiIcon.setImage(imageO, for: UIControlState.normal)
            break
        case 0: self.playerAlias = imageO
        self.aiAlias = imageX
        selectX.isEnabled = false
        self.playerIcon.setImage(imageO, for: UIControlState.normal)
        self.aiIcon.setImage(imageX, for: UIControlState.normal)
            break
        default: break
        }
        if let newGame = self.game{
            print("new game")
            newGame.currentPlayer = playerAlias
            newGame.currentAI = aiAlias
        }
            return
        }
    }
    
    // Semaphores
    func waitAi(){
        
        flag = true //Flag Up
        
        let spot: RowColumn =  try! self.game!.aiBestMove()
        let space = game?.board.getSpot(row: spot.row!, column: spot.column!)
        print("space:\(space!)")
        
        switch(space!){
        case 0: play(openMove: upperLeft, row: spot.row!, column: spot.row!)
            break
        case 1: play(openMove: up, row: spot.row!, column: spot.column!)
            break
        case 2: play(openMove: upperRight, row: spot.row!, column: spot.column!)
            break
        case 3: play(openMove: left, row: spot.row!, column: spot.column!)
            break
        case 4: play(openMove: middle, row: spot.row!, column: spot.column!)
            break
        case 5: play(openMove: right, row: spot.row!, column: spot.column!)
            break
        case 6: play(openMove: upperRight, row: spot.row!, column: spot.column!)
            break
        case 7: play(openMove: down, row: spot.row!, column: spot.column!)
            break
        case 8: play(openMove: upperRight, row: spot.row!, column: spot.column!)
            break
        default: break
        }
        
        flag = false //Flag Down
    }
    
    //MARK: Checks
    // -First Moves
    func boardFirstMove() -> Bool{
        var playerExist = 0
        for i in 0 ... Int((game?.board.boardSpace.count)!){
            if game?.board.boardSpace[i] == game?.currentPlayer{
                playerExist += 1
            }
        }
        if playerExist <= 1{
            return true
        }else{
            return false
        }
    }
    
    // -Selected
    func checkSelect()-> Bool{
        if (playerAlias == nil || aiAlias == nil){
            return false
        }else{
            return true
        }
    }
    
    //MARK: NotificationS
    func popWinner(){
        print("You are a WINNER!")
        let alertController = UIAlertController(title: "AI Won!", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Darn!", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    //MARK: Re-Settings
    //User test: Pass | Unit Test: None
    func clearBoard(){
        let boardSpot: [UIButton] = [upperLeft, up, upperRight,
                                     left, middle, right,
                                     bottomLeft, down, bottomRight]
        for buttons in boardSpot{
            buttons.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
        }
        player = nil
        playerAlias = nil
        ai = nil
        aiAlias = nil
        game?.board.clearBoard()
        flag = false
        selectX.isEnabled = true
        selectO.isEnabled = true
        gameStart = false
    }
    
    //User test: Pass | Unit Test: None
    func scoreReset(){
        game = nil
        aiWin.text = "\(0)"
        aiLoss.text = "\(0)"
        playerWin.text = "\(0)"
        playerLoss.text = "\(0)"
    }
    
    
    // MARK: Conformance -StartGame
    func play(openMove: UIButton, row: Int, column: Int){
        if(checkSelect()){
            guard((openMove.currentImage?.isEqual(imageX))! || (openMove.currentImage?.isEqual(imageO))!) else{
                if (!flag){
                    openMove.setImage(self.playerAlias, for: UIControlState.normal)
                    game?.board.setSpace(value: (game?.currentPlayer)!, row: row, column: column)
                    if(game?.gameOver(player: (game?.currentPlayer)!))!{
                        print("PLAYER HAS WON!")
                        game?.player?.win += 1
                        game?.ai?.loss -= 1
                        displayScore()
                        print(game?.board ?? "none")
                        return
                    }
                    print("before ai\(String(describing: game?.board))")
                    waitAi()//semaphores
                    print("after ai\(String(describing: game?.board))")
                    
                }
                else if (flag){
                    openMove.setImage(aiAlias, for: UIControlState.normal)
                    game?.board.setSpace(value: (game?.currentAI)!, row: row, column: column)
                    print("before player\(String(describing: game?.board))")
                    if(game?.gameOver(player: (game?.currentAI)!))!{
                        print("AI HAS WON!")
                        game?.ai?.win += 1
                        game?.player?.loss -= 1
                        displayScore()
                        print(game?.board ?? "none")
                        return
                        
                    }
                }
                return
            }
        }
    }
    
    func displayScore(){
        aiWin.text = String(describing: game?.ai?.win as! Int)
        aiLoss.text = String(describing: game?.ai?.loss as! Int)
        playerWin.text = String(describing: game?.player?.win as! Int)
        playerLoss.text = String(describing: game?.player?.loss as! Int)
    }
    
    
    
    
}



