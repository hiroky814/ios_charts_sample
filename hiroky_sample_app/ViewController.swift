//
//  ViewController.swift
//  hiroky_sample_app
//
//  Created by hiroky on 2020/04/04.
//  Copyright © 2020 hiroky.sample. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    //let data:[Double] = [60, 75, 70, 72, 89, 82, 92, 79]
    let data:[Double] = [84, 49, 80, 76, 83, 93, 90, 86]
    let xValues:[String] = ["10", "11", "12", "13", "14", "15", "16", "17"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x:0, y: 30, width: self.view.frame.width, height: self.view.frame.height - 30)
        let chartView = LineChartView(frame: rect)

        // ラベル（凡例）の有無
        chartView.legend.enabled = false

        // x軸の設定
        // ラベルの表示場所
        chartView.xAxis.labelPosition = .bottom
        // グリッド線の有無
        chartView.xAxis.drawGridLinesEnabled = false
        // 小数点を描画しない
        chartView.xAxis.granularity = 1.0
        chartView.xAxis.granularityEnabled = true
        
        // y軸の設定
        // y軸（右端）の有無
        chartView.rightAxis.enabled = false
        // y軸（左端）の有無
        chartView.leftAxis.enabled = true
        // y軸の表示範囲（0〜100）
        chartView.leftAxis.axisMinimum = 0
        chartView.leftAxis.axisMaximum = 100
        // ラベルの個数（＝グリッド線の数）
        chartView.leftAxis.labelCount = 11
        // グリッド線の有無
        chartView.leftAxis.drawAxisLineEnabled = false
        // 小数点を描画しない
        chartView.leftAxis.granularityEnabled = true
        chartView.leftAxis.granularity = 1.0
        
        var entry = [ChartDataEntry]()

        for (i, d) in data.enumerated() {
            entry.append(ChartDataEntry(x: Double(atof(xValues[i])), y: d ))
        }

        let dataSet = LineChartDataSet(entries: entry, label: "data")
        // 線の色
        dataSet.colors = [NSUIColor.red, NSUIColor.green, NSUIColor.green, NSUIColor.green, NSUIColor.green, NSUIColor.green, NSUIColor.green]
        // プロットの色
        dataSet.circleColors = [NSUIColor.green, NSUIColor.red, NSUIColor.green, NSUIColor.green, NSUIColor.green, NSUIColor.green, NSUIColor.green, NSUIColor.green]
        // プロットの大きさ
        dataSet.circleRadius = 5
        // プロットの値のフォント
        dataSet.valueFont = UIFont(name: "GillSans", size: 15)!
        // プロットの数値を整数で表示
        dataSet.valueFormatter = BarChartValueFormatter()

        chartView.data = LineChartData(dataSet: dataSet)

        self.view.addSubview(chartView)
    }
    
    // プロットの数値を少数ではなく整数で表示
    class BarChartValueFormatter: NSObject, IValueFormatter{
        public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String{
            return String(Int(entry.y))
        }
    }

}

