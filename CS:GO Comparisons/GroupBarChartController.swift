//
//  GroupBarChartController.swift
//  CS:GO Comparisons
//
//  Created by bob on 22/03/16.
//  Copyright © 2016 bob. All rights reserved.
//


import UIKit
import SwiftCharts

class GroupBarChartController: UIViewController {
   
    @IBOutlet weak var chart: UIView!
    
    
    override func viewDidLoad() {
        let chartConfig = BarsChartConfig(
            valsAxisConfig: ChartAxisConfig(from: 0, to: 8, by: 2)
        )
        
        let chart = BarsChart(
            frame: CGRectMake(0, 70, 300, 500),
            chartConfig: chartConfig,
            xTitle: "X axis",
            yTitle: "Y axis",
            bars: [
                ("A", 2),
                ("B", 4.5),
                ("C", 3),
                ("D", 5.4),
                ("E", 6.8),
                ("F", 0.5)
            ],
            color: UIColor.redColor(),
            barWidth: 15
        )
        
        self.view.addSubview(chart.view)
//        self.chart = chart
    }
}