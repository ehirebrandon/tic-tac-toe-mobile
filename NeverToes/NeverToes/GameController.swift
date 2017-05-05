//
//  ViewController.swift
//  NeverToes
//
//  Created by Brandon Lai on 5/4/17.
//  Copyright © 2017 Brandon Lai. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    // AI & Player Icons Actions & Outlets
    @IBOutlet weak var aiIcon: UIButton!
    @IBOutlet weak var playerIcon: UIButton!
    // Board Actions & Outlets
    
    @IBOutlet weak var upperLeft: UIButton!
    @IBAction func upperLeft(_ sender: Any) {
    }
    @IBOutlet weak var up: UIButton!
    @IBAction func up(_ sender: Any) {
    }
    @IBOutlet weak var upperRight: UIButton!
    @IBAction func upperRight(_ sender: Any) {
    }
    @IBOutlet weak var left: UIButton!
    @IBAction func left(_ sender: Any) {
    }
    @IBOutlet weak var middle: UIButton!
    @IBAction func middle(_ sender: Any) {
    }
    @IBOutlet weak var right: UIButton!
    @IBAction func right(_ sender: Any) {
    }
    @IBOutlet weak var bottomLeft: UIButton!
    
    @IBAction func bottomLeft(_ sender: Any) {
    }
    @IBOutlet weak var down: UIButton!
    @IBAction func down(_ sender: Any) {
    }
    @IBOutlet weak var bottomRight: UIButton!
    @IBAction func bottomRight(_ sender: Any) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

