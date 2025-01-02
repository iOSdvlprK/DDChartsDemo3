//
//  ContentView.swift
//  DDChartsDemo3
//
//  Created by joe on 12/31/24.
//

import SwiftUI
import Charts

enum ChartType {
    case bar, line, area
}

struct ContentView: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let barColors: [Color]
    @State var chartType: ChartType = .bar
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
                    switch chartType {
                    case .bar:
                        BarMark(
                            x: .value("Day", item.day),
                            y: .value("Sales", item.sales)
                        )
                        .foregroundStyle(by: .value("Day", item.day))
                    case .line:
                        LineMark(
                            x: .value("Day", item.day),
                            y: .value("Sales", item.sales)
                        )
                    case .area:
                        AreaMark(
                            x: .value("Day", item.day),
                            y: .value("Sales", item.sales)
                        )
                    }
                }
            }
            
            // chart buttons
            HStack {
                Button(action: {
                    withAnimation {
                        chartType = .bar
                    }
                }, label: {
                    Text("BAR")
                })
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        chartType = .line
                    }
                }, label: {
                    Text("LINE")
                })
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        chartType = .area
                    }
                }, label: {
                    Text("AREA")
                })
            }
            .padding()
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
