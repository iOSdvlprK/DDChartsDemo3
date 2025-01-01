//
//  DDChartsDemo3App.swift
//  DDChartsDemo3
//
//  Created by joe on 12/31/24.
//

import SwiftUI

@main
struct DDChartsDemo3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                dailySales: defaultDailySales,
                min: 0.0,
                max: 700.0,
                barColors: defaultBarColors
            )
        }
    }
}
