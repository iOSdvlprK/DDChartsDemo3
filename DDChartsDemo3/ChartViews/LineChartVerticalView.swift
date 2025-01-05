//
//  LineChartVerticalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct LineChartVerticalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
            }
        }
    }
}

#Preview {
    LineChartVerticalView(dailySales: defaultDailySales)
}
