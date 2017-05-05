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
    
    let aX = UIImage(named: "X")!
    let aO = UIImage(named: "O")!
    var nextAlias: UIImage?
    var currentPlayer: String?
    var flag: Bool?
    
    
    var player: Player? = nil
    var ai: AI? = nil
    
    var gameBoard = ["0","1","2",
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
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 0)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
                
                
                
            }
            print(gameBoard)
        }
    }
    @IBOutlet weak var up: UIButton!
    @IBAction func up(_ sender: Any) {
        if(checkSelect()){
            guard((up.currentImage?.isEqual(aX))! || (up.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    up.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[1] = currentPlayer!
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 1)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
            }
            print(gameBoard)
        }
    }
    @IBOutlet weak var upperRight: UIButton!
    @IBAction func upperRight(_ sender: Any) {
        if(checkSelect()){
            guard((upperRight.currentImage?.isEqual(aX))! || (upperRight.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    upperRight.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[2] = currentPlayer!
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 2)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
            }
            print(gameBoard)
        }
    }
    @IBOutlet weak var left: UIButton!
    @IBAction func left(_ sender: Any) {
        if(checkSelect()){
            guard((left.currentImage?.isEqual(aX))! || (left.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    left.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[3] = currentPlayer!
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 3)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
            }
            print(gameBoard)
        }
    }
    @IBOutlet weak var middle: UIButton!
    @IBAction func middle(_ sender: Any) {
        if(checkSelect()){
            guard((middle.currentImage?.isEqual(aX))! || (middle.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    middle.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[4] = currentPlayer!
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 4)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
            }
            print(gameBoard)
        }
    }
    @IBOutlet weak var right: UIButton!
    @IBAction func right(_ sender: Any) {
        if(checkSelect()){
            guard((right.currentImage?.isEqual(aX))! || (right.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    right.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[5] = currentPlayer!
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 5)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
            }
            print(gameBoard)
        }
    }
    @IBOutlet weak var bottomLeft: UIButton!
    
    @IBAction func bottomLeft(_ sender: Any) {
        if(checkSelect()){
            guard((bottomLeft.currentImage?.isEqual(aX))! || (bottomLeft.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    bottomLeft.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[6] = currentPlayer!
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 6)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
            }
            print(gameBoard)
        }
    }
    @IBOutlet weak var down: UIButton!
    @IBAction func down(_ sender: Any) {
        if(checkSelect()){
            guard((down.currentImage?.isEqual(aX))! || (down.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    down.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[7] = currentPlayer!
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 7)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
            }
            print(gameBoard)
        }
    }
    @IBOutlet weak var bottomRight: UIButton!
    @IBAction func bottomRight(_ sender: Any) {
        if(checkSelect()){
            guard((bottomRight.currentImage?.isEqual(aX))! || (bottomRight.currentImage?.isEqual(aO))!) else{
                if (!flag!){
                    bottomRight.setImage(nextAlias, for: UIControlState.normal)
                    gameBoard[8] = currentPlayer!
                    print(gameCheck())
                    print(gameBoard)
                    waitAi(board: gameBoard, playerMove: 8)//semaphores
                }
                if (flag!){
                    waitPlayer()
                }
                return
            }
            print(gameBoard)
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
        currentPlayer = ai?.alias
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
    func gameCheck() -> Bool{
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
    
    func waitAi(board: [String], playerMove: Int){
        flag = true
        aiMoves(board: board, playerMove: playerMove)
    }
    func waitPlayer(){
        flag = true
    }
    
    //ai algorithm/method of winning
    func aiMoves(board: [String], playerMove: Int){
        //base condition
        if (boardFirstMove()){
        //Case 1: If players go anywhere on [0,2,6,8] AI must go to [4]
            if (board[playerMove] == currentPlayer){
                
            }
        //Case 2: If players go to [4] AI must go to [0,2,6,8]
        //Case 3: If Player -> [1,3,5,7] AI -> Anywhere
        }
    }
    // MARK: Helper Functions
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
    }
    func scoreReset(){
        aiWin.text = "\(0)"
        aiLose.text = "\(0)"
        playerWin.text = "\(0)"
        playerLose.text = "\(0)"
        player = nil
        ai = nil
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


