//
//  ContentView.swift
//  DDChartsDemo3
//
//  Created by joe on 12/31/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let barColors: [Color]
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var isVerticalChart = true
    
    var body: some View {
        VStack {
            Text("Chart Demo 3")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Chart {
                ForEach(dailySales) { item in
                    BarMark(
                        x: .value("Day", item.day),
                        y: .value("Sales", item.sales)
                    )
                    .foregroundStyle(by: .value("Day", item.day))
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(
        dailySales: defaultDailySales,
        min: 0.0,
        max: 700.0,
        barColors: defaultBarColors
    )
}
