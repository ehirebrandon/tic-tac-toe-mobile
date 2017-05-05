//
//  ViewController.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import UIKit

class GameController: UIViewController, StartGame {
    
    @IBOutlet weak var aiWin: UILabel!
    @IBOutlet weak var aiLose: UILabel!
    @IBOutlet weak var playerWin: UILabel!
    @IBOutlet weak var playerLose: UILabel!
    
    fileprivate let aX = UIImage(named: "X")!
    fileprivate let aO = UIImage(named: "O")!
    fileprivate var nextAlias: UIImage?
    fileprivate var aiAlias: UIImage?
    fileprivate var currentPlayer: String?
    fileprivate var flag: Bool?
    fileprivate var gameStop: Bool?
    
    fileprivate var player: Player? = nil
    fileprivate var ai: AI? = nil
    
    fileprivate var gameBoard = ["0","1","2",
                                 "3","4","5",
                                 "6","7","8"]
    
    
    // AI & Player Icons Actions & Outlets
    @IBOutlet weak var aiIcon: UIButton!
    @IBOutlet weak var playerIcon: UIButton!
    
    // Board Actions & Outlets
    @IBOutlet weak var upperLeft: UIButton!
    @IBAction func upperLeft(_ sender: Any) {
        if(checkSelect()){
            guard((upperLeft.currentImage?.isEqual(aX))! || (upperLeft.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    upperLeft.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[0] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 0)//semaphores
                }
                return
            }
        }
    }
    @IBOutlet weak var up: UIButton!
    @IBAction func up(_ sender: Any) {
        if(checkSelect()){
            guard((up.currentImage?.isEqual(aX))! || (up.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    up.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[1] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 1)//semaphores
                }
                return
            }
        }
    }
    @IBOutlet weak var upperRight: UIButton!
    @IBAction func upperRight(_ sender: Any) {
        if(checkSelect()){
            guard((upperRight.currentImage?.isEqual(aX))! || (upperRight.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    upperRight.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[2] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 2)//semaphores
                }
                return
            }
        }
    }
    @IBOutlet weak var left: UIButton!
    @IBAction func left(_ sender: Any) {
        if(checkSelect()){
            guard((left.currentImage?.isEqual(aX))! || (left.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    left.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[3] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 3)//semaphores
                }
                return
            }
        }
    }
    @IBOutlet weak var middle: UIButton!
    @IBAction func middle(_ sender: Any) {
        if(checkSelect()){
            guard((middle.currentImage?.isEqual(aX))! || (middle.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    middle.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[4] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 4)//semaphores
                }
                return
            }
        }
    }
    @IBOutlet weak var right: UIButton!
    @IBAction func right(_ sender: Any) {
        if(checkSelect()){
            guard((right.currentImage?.isEqual(aX))! || (right.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    right.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[5] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 5)//semaphores
                }
                return
            }
        }
    }
    @IBOutlet weak var bottomLeft: UIButton!
    
    @IBAction func bottomLeft(_ sender: Any) {
        if(checkSelect()){
            guard((bottomLeft.currentImage?.isEqual(aX))! || (bottomLeft.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    bottomLeft.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[6] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 6)//semaphores
                }
                return
            }
        }
    }
    @IBOutlet weak var down: UIButton!
    @IBAction func down(_ sender: Any) {
        if(checkSelect()){
            guard((down.currentImage?.isEqual(aX))! || (down.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    down.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[7] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 7)//semaphores
                }
                return
            }
        }
    }
    @IBOutlet weak var bottomRight: UIButton!
    @IBAction func bottomRight(_ sender: Any) {
        if(checkSelect()){
            guard((bottomRight.currentImage?.isEqual(aX))! || (bottomRight.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    bottomRight.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[8] = currentPlayer!
                    print(gameCheck(gameBoard: self.gameBoard))
                    print(gameBoard)
                    waitAi(playerMove: 8)//semaphores
                }
                return
            }
        }
    }
    // Select & Re-[Set/Start] buttons
    @IBOutlet weak var selectO: UIButton!
    @IBAction func selectO(_ sender: Any) {
        if player == nil{
            player = Player(alias: "O", win: 0, lose: 0)
            ai = AI(alias: "X", win: 0, lose: 0)
        }
        nextAlias = aO
        aiAlias = aX
        currentPlayer = player?.alias
        selectX.setImage(aX.dim(by: 0.5), for: UIControlState.normal)
        selectO.setImage(aO, for: UIControlState.normal)
        self.playerIcon.setImage(aO, for: UIControlState.normal)
        self.aiIcon.setImage(aX, for: UIControlState.normal)
    }
    @IBOutlet weak var selectX: UIButton!
    @IBAction func selectX(_ sender: Any) {
        if player == nil{
            player = Player(alias: "X", win: 0, lose: 0)
            ai = AI(alias: "O", win: 0, lose: 0)
        }
        currentPlayer = player?.alias
        nextAlias = aX
        aiAlias = aO
        selectO.setImage(aO.dim(by: 0.5), for: UIControlState.normal)
        selectX.setImage(aX, for: UIControlState.normal)
        self.playerIcon.setImage(aX, for: UIControlState.normal)
        self.aiIcon.setImage(aO, for: UIControlState.normal)
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
        // Do any additional setup after loading the view, typically from a nib.
        flag = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Conformance >> StartGame
    func play(){
    }
    
    func gameCheck(gameBoard: [String]) -> Bool{
        
        if (gameBoard[0] == gameBoard[1] && gameBoard[1] == gameBoard[2]){
            return true
        }
        if (gameBoard[3] == gameBoard[4] && gameBoard[4] == gameBoard[5]){
            return true
        }
        if (gameBoard[6] == gameBoard[7] && gameBoard[7] == gameBoard[8]){
            return true
        }
        if (gameBoard[0] == gameBoard[3] && gameBoard[3] == gameBoard[6]){
            return true
        }
        if (gameBoard[1] == gameBoard[4] && gameBoard[4] == gameBoard[7]){
            return true
        }
        if (gameBoard[2] == gameBoard[5] && gameBoard[5] == gameBoard[8]){
            return true
        }
        if (gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8]){
            return true
        }
        if (gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6]){
            return true
        }
        
        return false
    }
    func reverseGameCheck(gameBoard: [String]) -> Bool{
        
        if (gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6]){
            return true
        }
        if (gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8]){
            return true
        }
        if (gameBoard[2] == gameBoard[5] && gameBoard[5] == gameBoard[8]){
            return true
        }
        if (gameBoard[1] == gameBoard[4] && gameBoard[4] == gameBoard[7]){
            return true
        }
        if (gameBoard[0] == gameBoard[3] && gameBoard[3] == gameBoard[6]){
            return true
        }
        if (gameBoard[6] == gameBoard[7] && gameBoard[7] == gameBoard[8]){
            return true
        }
        if (gameBoard[3] == gameBoard[4] && gameBoard[4] == gameBoard[5]){
            return true
        }
        if (gameBoard[0] == gameBoard[1] && gameBoard[1] == gameBoard[2]){
            return true
        }
        
        return false
    }
    
    func waitAi(playerMove: Int){
        flag = true
        aiMoves(playerMove: playerMove)
        flag = false
    }
    
    
    //ai algorithm/method of winning
    func aiMoves(playerMove: Int){
        //base condition
        if (boardFirstMove()){
            //Case 1: If players go anywhere on [0,2,6,8] AI must go to [4]
            if ((playerMove == 0) || (playerMove == 2) || (playerMove == 6) || (playerMove == 8)){
                middle.setImage(aiAlias, for: UIControlState.normal)
                self.gameBoard[4] = (ai?.alias)!
            }
            //Case 2: If players go to [4] AI must go to [0,2,6,8]
            if ((playerMove == 4)){
                let randomArray = [0,2,6,8]
                let randomNumber = Int(arc4random_uniform(4))
                let resultRandom = randomArray[randomNumber]
                self.gameBoard[resultRandom] = (ai?.alias)!
                switch(resultRandom){
                case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                case 2: upperRight.setImage(aiAlias, for: UIControlState.normal)
                case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                case 8: bottomRight.setImage(aiAlias, for: UIControlState.normal)
                default: print("There is an error")
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
                    self.gameBoard[resultRandom] = (ai?.alias)!
                    switch(resultRandom){
                    case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                    case 1: up.setImage(aiAlias, for: UIControlState.normal)
                    case 2: upperRight.setImage(nextAlias, for: UIControlState.normal)
                    case 3: left.setImage(aiAlias, for: UIControlState.normal)
                    case 4: middle.setImage(aiAlias, for: UIControlState.normal)
                    case 5: right.setImage(aiAlias, for: UIControlState.normal)
                    case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                    case 7: down.setImage(aiAlias, for: UIControlState.normal)
                    case 8: bottomRight.setImage(nextAlias, for: UIControlState.normal)
                    default: print("There is an error")
                    }
                }
            }
        }else{
            if(lookForWin(client: (ai?.alias)!)){
                popWinner()
            }
            //List of priorities of how the game should be played
            //Look for next move
            if(!lookForWin(client: (ai?.alias)!)){
                //look for a block if that is not possible
                lookForBlock()
                //look for an optimal set up for a double in order to win the next
                lookForDouble(board: gameBoard)
                //if with no avail randomize a non-detrimental move
                lookForSingle()
            }
            
        }
    }
    // MARK: Helper Functions
    func lookForWin(client: String) -> Bool{
        var checkPlayerExist = 0;
        var aWinner = false
        switch(client){
        case (ai?.alias)!:
            for i in 0 ..< gameBoard.count{
                if gameBoard[i] == currentPlayer!{
                    checkPlayerExist += 1
                }
            }
            if checkPlayerExist < 2{
                return false
            }
            else{
                for i in 0 ..< gameBoard.count{
                    if (gameBoard[i] != player?.alias && gameBoard[i] != ai?.alias){
                        var gameCopy = gameBoard
                        gameCopy[i] = (ai?.alias)!
                        if (gameCheck(gameBoard: gameCopy)){
                            aWinner = true
                            print("AI: WINNING MOVE AVAILABLE")
                            gameBoard[i] = (ai?.alias)!
                            switch(i){
                            case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                            case 1: up.setImage(aiAlias, for: UIControlState.normal)
                            case 2: upperRight.setImage(aiAlias, for: UIControlState.normal)
                            case 3: left.setImage(aiAlias, for: UIControlState.normal)
                            case 4: middle.setImage(aiAlias, for: UIControlState.normal)
                            case 5: right.setImage(aiAlias, for: UIControlState.normal)
                            case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                            case 7: down.setImage(aiAlias, for: UIControlState.normal)
                            case 8: bottomRight.setImage(aiAlias, for: UIControlState.normal)
                            default: print("There is an error")
                            }
                        }
                        break
                    }
                }
            }
        case (player?.alias)!:
            for i in 0 ..< gameBoard.count{
                if gameBoard[i] == currentPlayer!{
                    checkPlayerExist += 1
                }
            }
            if checkPlayerExist < 2{
                return false
            }else{
                labels: for i in 0 ..< gameBoard.count{
                    if (gameBoard[i] != player?.alias || gameBoard[i] != ai?.alias){
                        var gameCopy = gameBoard
                        gameCopy[i] = (player?.alias)!
                        if (gameCheck(gameBoard: gameCopy)){
                            print("Block: Player have a WIN MOVE")
                            gameBoard[i] = (ai?.alias)!
                            aWinner = true
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
                            }
                        }
                    }
                }
            }
        default: print("Nothing here")
        }
       
        return aWinner
    }
    
    func lookForBlock(){
        if (lookForWin(client: (player?.alias)!)){
            print("just block player")
        }
    }
    
    func lookForDouble(board: [String]){
        var gameCopy = board
        for i in 0 ..< board.count{
            if (board[i] != player?.alias && board[i] != ai?.alias){
                gameCopy[i] = (ai?.alias)!
                if (gameCheck(gameBoard: gameCopy) && reverseGameCheck(gameBoard: gameCopy)){
                    gameBoard[i] = gameCopy[i]
                    switch(i){
                    case 0: upperLeft.setImage(aiAlias, for: UIControlState.normal)
                    case 1: up.setImage(aiAlias, for: UIControlState.normal)
                    case 2: upperRight.setImage(aiAlias, for: UIControlState.normal)
                    case 3: left.setImage(aiAlias, for: UIControlState.normal)
                    case 4: middle.setImage(aiAlias, for: UIControlState.normal)
                    case 5: right.setImage(aiAlias, for: UIControlState.normal)
                    case 6: bottomLeft.setImage(aiAlias, for: UIControlState.normal)
                    case 7: down.setImage(aiAlias, for: UIControlState.normal)
                    case 8: bottomRight.setImage(aiAlias, for: UIControlState.normal)
                    default: print("There is an error")
                    }
                }
            }
            break
        }
    }
    
    
    func lookForDoubleWin(board: [String]) -> Bool{
        var checkPlayerExist = 0;
        var aDoubleWinner = false
        
        for i in 0 ..< gameBoard.count{
            if board[i] == currentPlayer!{
                checkPlayerExist += 1
            }
        }
        if checkPlayerExist < 2{
            return false
        }
        else{
            for i in 0 ..< board.count{
                if (board[i] != player?.alias && board[i] != ai?.alias){
                    var gameCopy = board
                    gameCopy[i] = (ai?.alias)!
                    if (gameCheck(gameBoard: gameCopy) && reverseGameCheck(gameBoard: gameCopy)){
                        aDoubleWinner = true
                        print("DOUBLE WIN AVAILABLE")
                    }
                }
            }
        }
        
        
        return aDoubleWinner
    }
    
    
    func lookForSingle(){
        let randomNumber = Int(arc4random_uniform(9))
        print("Random Number: \(randomNumber)")
        for _ in 0 ..< gameBoard.count{
            if (gameBoard[randomNumber] != player?.alias && gameBoard[randomNumber] != ai?.alias){
                self.gameBoard[randomNumber] = (ai?.alias)!
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
        var checkPlayerExist = 0;
        for i in 0 ..< gameBoard.count{
            if gameBoard[i] == currentPlayer!{
                checkPlayerExist += 1
            }
        }
        if checkPlayerExist == 1{
            return true
        }else{
            return false
        }
    }
    
    
    
    func checkSelect()-> Bool{
        var bool = true
        if (nextAlias == nil){
            let alertController = UIAlertController(title: "Hey!", message: "Please select an alias to start", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            bool = false
            self.present(alertController, animated: true, completion: nil)
        }
        return bool
    }
    func popWinner(){
        var bool = true
        if (nextAlias == nil){
            let alertController = UIAlertController(title: "AI Won!", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Darn!", style: UIAlertActionStyle.default, handler: nil))
            bool = false
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
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
        nextAlias = nil
        aiAlias = nil
        player = nil
        ai = nil
        flag = false
        gameBoard =  ["0","1","2",
                      "3","4","5",
                      "6","7","8"]
    }
    func scoreReset(){
        nextAlias = nil
        aiAlias = nil
        aiWin.text = "\(0)"
        aiLose.text = "\(0)"
        playerWin.text = "\(0)"
        playerLose.text = "\(0)"
        player = nil
        ai = nil
        flag = false
        gameBoard =  ["0","1","2",
                      "3","4","5",
                      "6","7","8"]
    }
    
    
}

extension UIImage{
    func dim(by: CGFloat) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 62, height: 60), false, 1)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: by)
        let dimImage = UIGraphicsGetImageFromCurrentImageContext()
        return dimImage!
    }
}


