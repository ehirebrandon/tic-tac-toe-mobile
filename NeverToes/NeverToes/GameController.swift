//
//  ViewController.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//
import Foundation
import UIKit

class GameController: UIViewController, StartGame{
    
    @IBOutlet weak var aiWin: UILabel!
    @IBOutlet weak var aiLoss: UILabel!
    @IBOutlet weak var playerWin: UILabel!
    @IBOutlet weak var playerLoss: UILabel!
    
    var game: Game?
    
    fileprivate var player: Player?
    fileprivate var ai: AI?
    
    fileprivate let aX = UIImage(named: "X")!
    fileprivate let aO = UIImage(named: "O")!
    
    fileprivate var playerAlias: UIImage?
    fileprivate var aiAlias: UIImage?
    
    fileprivate var currentPlayer: String?
    fileprivate var flag = false
    fileprivate var gameStop: Bool?
    
 
    
    
    // AI & Player Icons Actions & Outlets
    @IBOutlet weak var aiIcon: UIButton!
    @IBOutlet weak var playerIcon: UIButton!
    
    // Board Actions & Outlets
    @IBOutlet weak var upperLeft: UIButton!
    @IBAction func upperLeft(_ sender: Any) {
        play(openMove: upperLeft, openSlot: 0)
    }
    @IBOutlet weak var up: UIButton!
    @IBAction func up(_ sender: Any) {
        play(openMove: up, openSlot: 1)
    }
    @IBOutlet weak var upperRight: UIButton!
    @IBAction func upperRight(_ sender: Any) {
        play(openMove: upperRight, openSlot: 2)
    }
    @IBOutlet weak var left: UIButton!
    @IBAction func left(_ sender: Any) {
        play(openMove: left, openSlot: 3)
    }
    @IBOutlet weak var middle: UIButton!
    @IBAction func middle(_ sender: Any) {
        play(openMove: middle, openSlot: 4)
    }
    @IBOutlet weak var right: UIButton!
    @IBAction func right(_ sender: Any) {
        play(openMove: right, openSlot: 5)
    }
    @IBOutlet weak var bottomLeft: UIButton!
    
    @IBAction func bottomLeft(_ sender: Any) {
        play(openMove: bottomLeft, openSlot: 6)
    }
    @IBOutlet weak var down: UIButton!
    @IBAction func down(_ sender: Any) {
        play(openMove: down, openSlot: 7)
    }
    @IBOutlet weak var bottomRight: UIButton!
    @IBAction func bottomRight(_ sender: Any) {
        play(openMove: bottomRight, openSlot: 8)
    }
    // Select & Re-[Set/Start] buttons
    @IBOutlet weak var selectO: UIButton!
    @IBAction func selectO(_ sender: Any) {
        if (player == nil && aiWin.text == "\(0)" && aiLoss.text == "\(0)" && playerWin.text == "\(0)" && playerLoss.text == "\(0)") {
            player = Player(alias: "O", win: 0, loss: 0)
            ai = AI(alias: "X", win: 0, loss: 0)
        }
        playerAlias = aO
        aiAlias = aX
        
        currentPlayer = player?.alias
        
        selectX.setImage(aX.dim(by: 0.5), for: UIControlState.normal)
        selectO.setImage(aO, for: UIControlState.normal)
        
        self.playerIcon.setImage(aO, for: UIControlState.normal)
        self.aiIcon.setImage(aX, for: UIControlState.normal)
        
        self.game = Game(ai: self.ai!, player: self.player!)
    }
    @IBOutlet weak var selectX: UIButton!
    @IBAction func selectX(_ sender: Any) {
        if (player == nil && aiWin.text == "\(0)" && aiLoss.text == "\(0)" && playerWin.text == "\(0)" && playerLoss.text == "\(0)"){
            player = Player(alias: "X", win: 0, loss: 0)
            ai = AI(alias: "O", win: 0, loss: 0)
        }
        currentPlayer = player?.alias
        playerAlias = aX
        aiAlias = aO
        selectO.setImage(aO.dim(by: 0.5), for: UIControlState.normal)
        selectX.setImage(aX, for: UIControlState.normal)
        self.playerIcon.setImage(aX, for: UIControlState.normal)
        self.aiIcon.setImage(aO, for: UIControlState.normal)
        self.game = Game(ai: self.ai!, player: self.player!)
    }
    @IBAction func restart(_ sender: Any) {
        clearBoard()
    }
    @IBAction func reset(_ sender: Any) {
        scoreReset()
        clearBoard()
    }
    
    //+++++++++++++++++++++++++++++++++ START +++++++++++++++++++++++++++++++++++++++++++++
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Conformance >> StartGame
    func play(openMove: UIButton, openSlot: Int){
        if(checkSelect()){
            guard((openMove.currentImage?.isEqual(aX))! || (openMove.currentImage?.isEqual(aO))!) else{
                if (!flag){
                    openMove.setImage(playerAlias, for: UIControlState.normal)
                    game?.gameBoard[openSlot] = currentPlayer!
                    waitAi(playerMove: openSlot)//semaphores
                }
                return
            }
        }
    }
    
    // Semaphores
    func waitAi(playerMove: Int){
        
        flag = true //Flag Up
        
        do{ try aiMoves(playerMove: playerMove)
        }catch MoveError.illegalMove{
            print("This is an illegal move!")
        }catch{
            print("There is move yields an error.")
        }
        
        flag = false //Flag Down
    }
    
    
    //ai algorithm/method of winning
    func aiMoves(playerMove: Int) throws{
        //base condition
        if (boardFirstMove()){
            //Case 1: If players go anywhere on [0,2,6,8] AI must go to [4]
            if ((playerMove == 0) || (playerMove == 2) || (playerMove == 6) || (playerMove == 8)){
                middle.setImage(aiAlias, for: UIControlState.normal)
                self.game?.gameBoard[4] = (ai?.alias)!
            }
            //Case 2: If players go to [4] AI must go to [0,2,6,8]
            if ((playerMove == 4)){
                let randomArray = [0,2,6,8]
                let randomNumber = Int(arc4random_uniform(4))
                let resultRandom = randomArray[randomNumber]
                self.game?.gameBoard[resultRandom] = (ai?.alias)!
                switch(resultRandom){
                case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 2: upperRight.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 8: bottomRight.setImage(aiAlias, for: UIControlState.normal)
                    break
                default: print("There is an error")
                    break
                }
            }
            //Case 3: If Player -> [1,3,5,7] AI -> Anywhere
            label:
                if ((playerMove == 1) || (playerMove == 3) || (playerMove == 5) || (playerMove == 7)){
                let randomArray = [0,1,2,3,5,6,7,8]
                let randomNumber = Int(arc4random_uniform(8))
                let resultRandom = randomArray[randomNumber]
                if(resultRandom == playerMove){
                    break label
                }else{
                    self.game?.gameBoard[resultRandom] = (ai?.alias)!
                    switch(resultRandom){
                    case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 1: up.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 2: upperRight.setImage(playerAlias, for: UIControlState.normal)
                        break
                    case 3: left.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 4: middle.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 5: right.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 7: down.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 8: bottomRight.setImage(playerAlias, for: UIControlState.normal)
                        break
                    default: print("There is an error")
                        break
                    }
                }
            }
        }else{
            if(game?.lookForWin(client: (ai?.alias)!, currentPlayer: currentPlayer))!{
                makeWin(client: (ai?.alias)!, currentPlayer: currentPlayer!)
                print("Making Win")
            }else if(game?.lookForWin(client: (player?.alias)!, currentPlayer: currentPlayer))!{
                // works like a block here ** look For Block
                makeWin(client: (player?.alias)!, currentPlayer: currentPlayer!)
                print("Making Block")
            }else if(game?.lookForDouble(board: (game?.gameBoard)!))!{
                print("I'm double check bool:\(String(describing: game?.lookForDouble(board: (game?.gameBoard)!)))")
                makeDouble(board: (game?.gameBoard)!)
            }else{
                makeSingle()
                print("Making Single")
            }
            
            
            
        }
    }
    
    // MARK: Helper Functions
    func makeWin(client: String, currentPlayer: String){
        switch(client){
        case (ai?.alias!)!:
            for i in 0 ..< (game?.gameBoard.count)! - 1{
                if (game?.gameBoard[i] != player?.alias && game?.gameBoard[i] != ai?.alias){
                    game?.gameBoard[i] = (ai?.alias!)!
                    switch(i){
                    case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 1: up.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 2: upperRight.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 3: left.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 4: middle.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 5: right.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 7: down.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 8: bottomRight.setImage(aiAlias, for: UIControlState.normal)
                        break
                    default: print("There is an error")
                        break
                    }
                break
                }
            }
            
        case (player?.alias!)!:
            for i in 0 ..< (game?.gameBoard.count)! - 1{
                if (game?.gameBoard[i] != player?.alias && game?.gameBoard[i] != ai?.alias){
                    game?.gameBoard[i] = (ai?.alias!)!
                    switch(i){
                    case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 1: up.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 2: upperRight.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 3: left.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 4: middle.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 5: right.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 7: down.setImage(aiAlias, for: UIControlState.normal)
                        break
                    case 8: bottomRight.setImage(aiAlias, for: UIControlState.normal)
                        break
                    default: print("There is an error")
                        break
                    }
                break
                }
            }
            break
        default: break
        }
    }
    
    
    
    func makeDouble(board: [String]){
        
    
        for i in 0 ..< board.count - 1{
            let gameCopy = board
            if (board[i] != player?.alias && board[i] != ai?.alias){
                game?.gameBoard[i] = (ai?.alias)!
                if ((game?.gameCheck(gameBoard: gameCopy))! && (game?.reverseGameCheck(gameBoard: gameCopy))!){
                    game?.gameBoard[i] = board[i]
                }
                switch(i){
                case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 1: up.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 2: upperRight.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 3: left.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 4: middle.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 5: right.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 7: down.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 8: bottomRight.setImage(aiAlias, for: UIControlState.normal)
                    break
                default: print("There is an error")
                    break
                }
            }
        }
    }
    
    func makeSingle(){
        let randomNumber = Int(arc4random_uniform(9))
        for _ in 0 ..< (game?.gameBoard.count)! - 1{
            if (game?.gameBoard[randomNumber] != player?.alias && game?.gameBoard[randomNumber] != ai?.alias){
            }
        }
        for _ in 0 ..< (game?.gameBoard.count)! - 1{
            if (game?.gameBoard[randomNumber] != player?.alias && game?.gameBoard[randomNumber] != ai?.alias){
                game?.gameBoard[randomNumber] = (ai?.alias)!
                switch(randomNumber){
                case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 1: up.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 2: upperRight.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 3: left.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 4: middle.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 5: right.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 7: down.setImage(aiAlias, for: UIControlState.normal)
                    break
                case 8: bottomRight.setImage(aiAlias, for: UIControlState.normal)
                    break
                default: print("There is an error")
                    break
                }
            }
        }
        
    }
    
    func boardFirstMove() -> Bool{
        var playerExist = 0
        for i in 0 ..< Int((game?.gameBoard.count)!){
            if game?.gameBoard[i] == currentPlayer!{
                playerExist += 1
            }
        }
        if playerExist == 1{
            return true
        }else{
            return false
        }
    }
    
    
    
    func checkSelect()-> Bool{
        var bool = true
        if (playerAlias == nil){
            let alertController = UIAlertController(title: "Hey!", message: "Please select an alias to start", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            bool = false
            self.present(alertController, animated: true, completion: nil)
        }
        return bool
    }
    
    func popWinner(){
        print("You are a WINNER!")
        
        let alertController = UIAlertController(title: "AI Won!", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Darn!", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //User test: Pass | Unit Test: None
    func clearBoard(){
                upperLeft.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                up.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                upperRight.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                left.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                middle.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                right.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                bottomLeft.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                down.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                bottomRight.setImage(UIImage(named: "Empty"), for: UIControlState.normal)
                playerAlias = nil
                aiAlias = nil
                player = nil
                ai = nil
                flag = false
                game?.gameBoard =  ["0","1","2",
                                   "3","4","5",
                                   "6","7","8"]
    }
    //User test: Pass | Unit Test: None
    func scoreReset(){
        game = nil
        aiWin.text = "\(0)"
        aiLoss.text = "\(0)"
        playerWin.text = "\(0)"
        playerLoss.text = "\(0)"
    }
    
    
}



