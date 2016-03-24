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
    }
}