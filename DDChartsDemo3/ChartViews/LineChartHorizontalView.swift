//
//  LineChartHorizontalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct LineChartHorizontalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(
                    x: .value("Sales", item.sales),
                    y: .value("Day", item.day)
                )
            }
        }
    }
}

#Preview {
    LineChartHorizontalView(dailySales: defaultDailySales)
}
