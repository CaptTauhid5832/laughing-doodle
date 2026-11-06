//
//  WeatherDashboardApp.swift
//  WeatherDashboard
//
//  Created by Capt. Tauhid on 1/9/26.
//

import SwiftUI

@main
struct WeatherDashboardApp: App {
    @State private var viewModel = WeatherViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}

