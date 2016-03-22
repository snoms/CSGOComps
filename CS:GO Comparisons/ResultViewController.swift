//
//  ResultViewController.swift
//  CS:GO Comparisons
//
//  Created by bob on 19/03/16.
//  Copyright © 2016 bob. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDelegate {
    
    let player1data = PlayerManager.sharedInstance.Players[0]
    let player2data = PlayerManager.sharedInstance.Players[1]
    
    @IBAction func printRefresh(sender: AnyObject) {
        print("test")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Reached Result screen")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
}