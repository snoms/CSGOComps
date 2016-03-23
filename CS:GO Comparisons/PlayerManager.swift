//
//  PlayerManager.swift
//  CS:GO Comparisons
//
//  Created by bob on 19/03/16.
//  Copyright © 2016 bob. All rights reserved.
//

import Foundation

class PlayerManager {
    
    static let sharedInstance = PlayerManager()
    
    var Players: Array<Player> = []
    
    var Player1 = Player(steamID: "0")
    var Player2 = Player(steamID: "0")

    
    private init() {
        newPlayer(Player1)
        newPlayer(Player2)
        Players[0].totalKills = 0.0
        Players[1].totalKills = 0.0
        Players[0].totalDeaths = 0.0
        Players[1].totalDeaths = 0.0
        Players[0].timePlayed = 0.0
        Players[1].timePlayed = 0.0
        Players[0].totalShots = 0.0
        Players[1].totalShots = 0.0
        Players[0].totalHits = 0.0
        Players[1].totalHits = 0.0
    }
    
    func newPlayer(player: Player) {
        Players.append(player)
//        var player = Player(steamID: steamID)
        
//        
//        let playerstring = "https://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=730&key=271A36B05E4810BE4F387CF3686EFD2A&steamid=" + (steamID as String)
//
//        
//        let playerURL = NSURL(string: playerstring)
//        
//        let session = NSURLSession.sharedSession()
//        
//        session.dataTaskWithURL(playerURL!, completionHandler: { data, response, error in
//            let responseStatusCode = (response as! NSHTTPURLResponse).statusCode
//            
//            print(responseStatusCode)
//            
//            do {
//                
//                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
//                
//                //print(json["playerstats"]!["stats"])
//                
//                if let stats = json["playerstats"]!["stats"] as? NSArray {
//                    
//                    for stat in stats {
//                        print(stat["name"])
//                        
//                        
//                        
//                        
//                    }
//                }
//                
//            } catch {
//                print(error)
//            }
//            
//        }).resume()
//
//        
//        
////        Players.append(player)
////        return player
//        
//        
//        
        
    }
}