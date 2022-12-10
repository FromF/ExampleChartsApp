//
//  ContentView.swift
//  ChartsApp
//
//  Created by 藤治仁 on 2022/11/26.
//

import SwiftUI
import Charts

struct PCSellData: Identifiable {
    let id = UUID()
    let month: Int
    let count: Int
    let type: String
}

// https://www.jeita.or.jp/japanese/stat/pc/
let PCSellYear: [PCSellData] = [
    PCSellData(month: 1, count: 107000, type: "DESKTOP"),
    PCSellData(month: 1, count: 1277000, type: "NOTE"),
    PCSellData(month: 2, count: 96000, type: "DESKTOP"),
    PCSellData(month: 2, count: 985000, type: "NOTE"),
    PCSellData(month: 3, count: 141000, type: "DESKTOP"),
    PCSellData(month: 3, count: 975000, type: "NOTE"),
    PCSellData(month: 4, count: 95000, type: "DESKTOP"),
    PCSellData(month: 4, count: 537000, type: "NOTE"),
    PCSellData(month: 5, count: 83000, type: "DESKTOP"),
    PCSellData(month: 5, count: 385000, type: "NOTE"),
    PCSellData(month: 6, count: 94000, type: "DESKTOP"),
    PCSellData(month: 6, count: 628000, type: "NOTE"),
    PCSellData(month: 7, count: 92000, type: "DESKTOP"),
    PCSellData(month: 7, count: 496000, type: "NOTE"),
    PCSellData(month: 8, count: 85000, type: "DESKTOP"),
    PCSellData(month: 8, count: 412000, type: "NOTE"),
    PCSellData(month: 9, count: 112000, type: "DESKTOP"),
    PCSellData(month: 9, count: 561000, type: "NOTE"),
    PCSellData(month: 10, count: 106000, type: "DESKTOP"),
    PCSellData(month: 10, count: 362000, type: "NOTE"),
    PCSellData(month: 11, count: 100000, type: "DESKTOP"),
    PCSellData(month: 11, count: 409000, type: "NOTE"),
    PCSellData(month: 12, count: 138000, type: "DESKTOP"),
    PCSellData(month: 12, count: 595000, type: "NOTE"),
]

struct ContentView: View {
    @State private var name: String = ""
    @State private var count: Int = 1
    var body: some View {
        VStack {
            Text("2021年パーソナルコンピュータ国内出荷実績")
                .bold()
                .minimumScaleFactor(0.5)
            Chart {
                ForEach(PCSellYear) { sellData in
                    BarMark(
                        x: .value("Count", sellData.count),
                        y: .value("Month", "\(sellData.month)月")
                    )
                    .foregroundStyle(by: .value("Type", sellData.type))
                }
            }
            .chartForegroundStyleScale (
                [
                    "DESKTOP": .green,
                    "NOTE": .purple,
                ]
            )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
