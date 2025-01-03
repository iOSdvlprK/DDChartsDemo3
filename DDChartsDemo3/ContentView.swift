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
                    if isVerticalChart {
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
                    } else { // horizontal
                        switch chartType {
                        case .bar:
                            BarMark(
                                x: .value("Sales", item.sales),
                                y: .value("Day", item.day)
                            )
                            .foregroundStyle(by: .value("Day", item.day))
                        case .line:
                            LineMark(
                                x: .value("Sales", item.sales),
                                y: .value("Day", item.day)
                            )
                        case .area:
                            AreaMark(
                                x: .value("Sales", item.sales),
                                y: .value("Day", item.day)
                            )
                        }
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
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isVerticalChart.toggle()
                    }
                }, label: {
                    Image(systemName: "chart.bar.fill")
                        .rotationEffect(.degrees(isVerticalChart ? 90 : 0))
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
