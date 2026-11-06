//
//  Forecast.swift
//  WeatherDashboard
//
//  Created by Capt. Tauhid on 1/9/26.
//

import Foundation

struct Forecast: Identifiable {
    let id = UUID()
    let day: String
    let icon: String
    let temperature: Int
    let condition: String
}

let forecastData: [Forecast] = [
    Forecast(day: "Monday", icon: "sun.max.fill", temperature: 74, condition: "Sunny"),
    Forecast(day: "Tuesday", icon: "cloud.sun.fill", temperature: 71, condition: "Partly Cloudy"),
    Forecast(day: "Wednesday", icon: "cloud.rain.fill", temperature: 65, condition: "Rain"),
    Forecast(day: "Thursday", icon: "cloud.fill", temperature: 68, condition: "Cloudy"),
    Forecast(day: "Friday", icon: "sun.max.fill", temperature: 76, condition: "Sunny")
]

