//
//  ViewController.swift
//  CS:GO Comparisons
//
//  Created by bob on 19/03/16.
//  Copyright © 2016 bob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputField1: UITextField!
    @IBOutlet weak var inputField2: UITextField!
    
    @IBAction func fillExamples(sender: AnyObject) {
        inputField1.text = "76561197970607640"
        inputField2.text = "76561198091490766"
    }
    
    @IBAction func showComparison(sender: AnyObject) {
        
        if inputField1.text != "" {
            performGetRequest(0)
        }
        if inputField2.text != "" {
            performGetRequest(1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputField1.placeholder = "Steam64 ID"
        inputField2.placeholder = "Steam64 ID"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func performGetRequest(playerField: Int) {
        
        var playerID = ""
        if playerField == 0 {
            playerID = inputField1.text!
        }
        
        if playerField == 1 {
            playerID = inputField2.text!
        }
        
        let playerstring = "https://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=730&key=271A36B05E4810BE4F387CF3686EFD2A&steamid=" + playerID

        let playerURL = NSURL(string: playerstring)
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(playerURL!, completionHandler: { data, response, error in
            let responseStatusCode = (response as! NSHTTPURLResponse).statusCode
            print(responseStatusCode)
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary

                if let stats = json["playerstats"]!["stats"] as? NSArray {
                    for stat in stats {
                        if stat["name"] as! String == "total_kills" {
                            PlayerManager.sharedInstance.Players[playerField].totalKills = stat["value"] as! Double
                        }
                        if stat["name"] as! String == "total_deaths" {
                            PlayerManager.sharedInstance.Players[playerField].totalDeaths = stat["value"] as! Double
                        }
                        if stat["name"] as! String == "total_time_played" {
                            var hoursPlayed = stat["value"] as! Double
                            hoursPlayed = hoursPlayed/60
                            PlayerManager.sharedInstance.Players[playerField].timePlayed = hoursPlayed 
                        }
                        if stat["name"] as! String == "total_shots_fired" {
                            PlayerManager.sharedInstance.Players[playerField].totalShots = stat["value"] as! Double
                        }
                        if stat["name"] as! String == "total_shots_hit" {
                            PlayerManager.sharedInstance.Players[playerField].totalHits = stat["value"] as! Double
                        }
                    }
                }
            } catch {
                print(error)
            }
        
        }).resume()
    }
}