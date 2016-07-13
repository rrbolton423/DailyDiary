//
//  StatsContentVC.swift
//  Quotidian
//
//  Created by Sam on 7/12/16.
//  Copyright © 2016 Sam Willsea. All rights reserved.
//

import UIKit
import JYGraphView

class StatsContentVC: UIViewController {

    @IBOutlet weak var monthGraph: JYGraphView!
    @IBOutlet weak var dayGraph: JYGraphView!
    
    @IBOutlet weak var statsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayBasicStats()
        populateMonthGraph()
        populateDayGraph()
    }
    
    private func displayBasicStats(){
        statsLabel.text = "Total entries: 8" + "\n" + "Total words: 1,045" + "\n" + "Avg words per entry: 303 " + "\n" + "Entries in the last 30 days: 7"
    }
    
    private func populateMonthGraph(){
        let monthData = [1,3,4,5,7,2,4,5,6,2,3]
        let monthLabels = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
        monthGraph.graphWidth = UInt(monthLabels.count * 42)
        styleGraph(monthGraph, withData: monthData, andLabels: monthLabels)
    }
    
    private func populateDayGraph(){
        let dayData = [0, 0, 0, 3, 4, 2, 1]
        let dayLabels = ["MON", "TUES", "WED", "THUR", "FRI", "SAT", "SUN"]
        dayGraph.graphWidth = UInt(self.view.frame.width - 50)
        styleGraph(dayGraph, withData: dayData, andLabels: dayLabels)

    }
    
    private func styleGraph(graph: JYGraphView, withData data: [Int], andLabels labelData: [String]){
        graph.graphData = data
        graph.graphDataLabels = labelData
        graph.strokeColor = UIColor.init(red: 243/255, green: 40/255, blue: 2/255, alpha: 1.0)
        graph.hidePoints = true
        graph.hideLabels = false
        graph.useCurvedLine = true
        graph.barColor = UIColor.clearColor()
        graph.labelBackgroundColor = UIColor.clearColor()
        graph.backgroundViewColor = UIColor.clearColor()
        graph.clipsToBounds = true
        graph.plotGraphData()
//      interfaceGroup.setBackgroundImage(graph.graphImage) //Useful for AppleWatch GraphImage generation
    }

}
