//
//  PlayerData.swift
//  CS:GO Comparisons
//
//  Created by bob on 19/03/16.
//  Copyright © 2016 bob. All rights reserved.
//

import Foundation

public class Player {
    
    public var steamID: String
//    var userID: String
    
    public var totalKills: Int
    public var totalDeaths: Int
    public var timePlayed: Int
    
    public var gunStats: Array<Gun>
    
    public var totalShots: Int
    public var totalHits: Int
    
    public init(steamID: String) {
        self.steamID = steamID
        self.totalKills = 0
        self.totalDeaths = 0
        self.timePlayed = 0
        self.totalShots = 0
        self.totalHits = 0
        self.gunStats = []
    }
    
}

public class Gun {
    public var name: String
    
    public var totalShots: Int
    public var totalHits: Int
    public var totalKills: Int
    
    public var accuracy: Int

    public init(name: String, totalShots: Int, totalHits: Int, totalKills: Int) {
        
        self.name = name
        self.totalShots = totalShots
        self.totalHits = totalHits
        self.totalKills = totalKills
        self.accuracy = totalHits/totalKills
    }
}