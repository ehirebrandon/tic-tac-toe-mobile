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
    
    var player: Player? = nil
    var ai: AI? = nil
    
    // AI & Player Icons Actions & Outlets
    @IBOutlet weak var aiIcon: UIButton!
    @IBOutlet weak var playerIcon: UIButton!
    // Board Actions & Outlets
    
    @IBOutlet weak var upperLeft: UIButton!
    @IBAction func upperLeft(_ sender: Any) {
        if(checkSelect()){
            upperLeft.setImage(nextAlias, for: UIControlState.normal)}
        
    }
    @IBOutlet weak var up: UIButton!
    @IBAction func up(_ sender: Any) {
        up.setImage(nextAlias, for: UIControlState.normal)
    }
    @IBOutlet weak var upperRight: UIButton!
    @IBAction func upperRight(_ sender: Any) {
        upperRight.setImage(nextAlias, for: UIControlState.normal)
    }
    @IBOutlet weak var left: UIButton!
    @IBAction func left(_ sender: Any) {
        left.setImage(nextAlias, for: UIControlState.normal)
    }
    @IBOutlet weak var middle: UIButton!
    @IBAction func middle(_ sender: Any) {
        middle.setImage(nextAlias, for: UIControlState.normal)
    }
    @IBOutlet weak var right: UIButton!
    @IBAction func right(_ sender: Any) {
        right.setImage(nextAlias, for: UIControlState.normal)
    }
    @IBOutlet weak var bottomLeft: UIButton!
    
    @IBAction func bottomLeft(_ sender: Any) {
        bottomLeft.setImage(nextAlias, for: UIControlState.normal)
    }
    @IBOutlet weak var down: UIButton!
    @IBAction func down(_ sender: Any) {
        down.setImage(nextAlias, for: UIControlState.normal)
    }
    @IBOutlet weak var bottomRight: UIButton!
    @IBAction func bottomRight(_ sender: Any) {
        bottomRight.setImage(nextAlias, for: UIControlState.normal)
    }
    // Select & Re-[Set/Start] buttons
    @IBAction func selectO(_ sender: Any) {
        nextAlias = aO
    }
    @IBAction func selectX(_ sender: Any) {
        nextAlias = aX
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Conformance >> StartGame
    func play(){
        
    }
    
    // MARK: Helper Functions
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
    }
    
    
}

