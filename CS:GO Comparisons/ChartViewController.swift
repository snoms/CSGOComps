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

        setChart(metrics, values: player1Data, values2: player2Data)
    }
    
    var months: [String]!
    var metrics: [String]!
    
    func setChart(dataPoints: [String], values: [Double], values2: [Double]) {
        barChartView.noDataText = "Error: No player data loaded yet."

        var dataEntries: [BarChartDataEntry] = []
        var dataEntries2: [BarChartDataEntry] = []
        barChartView.rightAxis.enabled = false
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values2[i], xIndex: i)
            dataEntries2.append(dataEntry)
        }
        
        let chartDataSet1 = BarChartDataSet(yVals: dataEntries, label: "Player 1")
        chartDataSet1.setColor(UIColor.redColor())
        let chartDataSet2 = BarChartDataSet(yVals: dataEntries2, label: "Player 2")
        
        let dataSets = [chartDataSet1, chartDataSet2]
        
        let chartData = BarChartData(xVals: metrics, dataSets: dataSets)
        barChartView.data = chartData
        barChartView.xAxis.setLabelsToSkip(0)
        barChartView.descriptionText = "Stat comparison between players"
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
    }
}