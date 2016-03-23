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
        inputField2.text = "76561197990988488"
    }
    
    
    @IBAction func showComparison(sender: AnyObject) {
        
        var player1 = Player(steamID: "")
        var player2 = Player(steamID: "")
        
        if inputField1.text != "" {
            performGetRequest(0)
//            PlayerManager.sharedInstance.newPlayer(player1)
            print(player1.totalKills)
            print("if field 1 ok")
            print(PlayerManager.sharedInstance.Players[0].totalKills)

        }
        
        if inputField2.text != "" {
            performGetRequest(1)
//            PlayerManager.sharedInstance.newPlayer(player2)
        }
//        performGetRequest()
//        showResults()
        print(PlayerManager.sharedInstance.Players[1].totalKills)
        //
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("reached initial screen")
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
//        let player2ID = inputField2.text
        
        if playerField == 1 {
            playerID = inputField2.text!
        }
        
        let playerstring = "https://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=730&key=271A36B05E4810BE4F387CF3686EFD2A&steamid=" + playerID
        
//        let player2string = "https://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=730&key=271A36B05E4810BE4F387CF3686EFD2A&steamid=" + player2ID!

        
        let playerURL = NSURL(string: playerstring)
//        let player2URL = NSURL(string: player2string)
        
//        let player = Player(steamID: "76561197970607640")
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithURL(playerURL!, completionHandler: { data, response, error in
            let responseStatusCode = (response as! NSHTTPURLResponse).statusCode
            
            print(responseStatusCode)
            
            do {
                
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                //print(json["playerstats"]!["stats"])
                
//                let player2 = Player(steamID: "76561197970607640")
                
                if let stats = json["playerstats"]!["stats"] as? NSArray {
                    
                    for stat in stats {
//                        print(stat["name"]!)
//                        print("between stats")
                        
                        if stat["name"] as! String == "total_kills" {
                            print("total kills found")
                            PlayerManager.sharedInstance.Players[playerField].totalKills = stat["value"] as! Double
                        }
                        if stat["name"] as! String == "total_deaths" {
                            print("total deaths found")
                            PlayerManager.sharedInstance.Players[playerField].totalDeaths = stat["value"] as! Double
                        }
                        if stat["name"] as! String == "total_time_played" {
                            print("total deaths found")
                            var hoursPlayed = stat["value"] as! Double
                            hoursPlayed = hoursPlayed/60
                            PlayerManager.sharedInstance.Players[playerField].timePlayed = hoursPlayed as! Double
                        }
                        if stat["name"] as! String == "total_shots_fired" {
                            print("total deaths found")
                            PlayerManager.sharedInstance.Players[playerField].totalShots = stat["value"] as! Double
                        }
                        if stat["name"] as! String == "total_shots_hit" {
                            print("total deaths found")
                            PlayerManager.sharedInstance.Players[playerField].totalHits = stat["value"] as! Double
                        }
                        
//                        if stat["name"] as! String == "total_deaths" {
//                            print("total deaths found")
//                      let AK = Gun("AK")
//                            player.totalDeaths = stat["value"] as! Int
//                        }
//
//                        self.gunStats = []
                        
                    }
//                    print("Kill:Death ratio: \(Double(player.totalKills)/Double(player.totalDeaths))")
//                    print(player.totalDeaths)
                }
                
            } catch {
                print(error)
            }
        
        }).resume()
//        return player
    }
    
    // http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=730&key=271A36B05E4810BE4F387CF3686EFD2A&steamid=76561197970607640
    
    // let player1URL : NSURL = "http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=730&key=271A36B05E4810BE4F387CF3686EFD2A&steamid=" + enteredsteamID1
    
    // let player2URL : NSURL = "http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=730&key=271A36B05E4810BE4F387CF3686EFD2A&steamid=" + enteredsteamID2
}

