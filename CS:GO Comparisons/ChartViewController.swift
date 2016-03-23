//
//  ChartViewController.swift
//  CS:GO Comparisons
//
//  Created by bob on 21/03/16.
//  Copyright © 2016 bob. All rights reserved.
//

import Foundation
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {
    
    var dataEntries: [BarChartDataEntry] = []
    var dataSets: [BarChartDataSet] = []
    var chartDataSet: BarChartDataSet?
    
    
    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        
        metrics = ["Kills", "Deaths", "Shots", "Hits", "Time Played (min)"]
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        let unitsBought = [30.0, 0.0, 20.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        var player1Data: [Double] = []
        var player2Data: [Double] = []

        
        player1Data.append(PlayerManager.sharedInstance.Players[0].totalKills)
        player2Data.append(PlayerManager.sharedInstance.Players[1].totalKills)
        player1Data.append(PlayerManager.sharedInstance.Players[0].totalDeaths)
        player2Data.append(PlayerManager.sharedInstance.Players[1].totalDeaths)
        player1Data.append(PlayerManager.sharedInstance.Players[0].totalShots)
        player2Data.append(PlayerManager.sharedInstance.Players[1].totalShots)
        player1Data.append(PlayerManager.sharedInstance.Players[0].totalHits)
        player2Data.append(PlayerManager.sharedInstance.Players[1].totalHits)
        player1Data.append(PlayerManager.sharedInstance.Players[0].timePlayed)
        player2Data.append(PlayerManager.sharedInstance.Players[1].timePlayed)

        
//        for i in 0..<player1Data.count {
//            dataEntries.append(player1Data[i])
//        }
//        
        
        
        setChart(metrics, values: player1Data, values2: player2Data)
    }
    
    
    var months: [String]!
    var metrics: [String]!
    
    func setChart(dataPoints: [String], values: [Double], values2: [Double]) {
        barChartView.noDataText = "Error: No player data loaded yet."

        var dataEntries: [BarChartDataEntry] = []
        var dataEntries2: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values2[i], xIndex: i)
            dataEntries2.append(dataEntry)
        }
        
        let chartDataSet1 = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartDataSet2 = BarChartDataSet(yVals: dataEntries2, label: "Units bought")
        
        let dataSets = [chartDataSet1, chartDataSet2]
        
        let chartData = BarChartData(xVals: metrics, dataSets: dataSets)
        barChartView.data = chartData
        
        barChartView.descriptionText = "Stat comparison between players"
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
    }
    
    
    
    
    
    
}