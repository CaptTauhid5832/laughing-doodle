//
//  HourlyForecast.swift
//  WeatherDashboard
//
//  Created by Capt. Tauhid on 1/9/26.
//
 
import Foundation
 
struct HourlyForecast: Identifiable {
    let id = UUID()
    let hour: String
    let icon: String
    let temperature: Int
}
 
let hourlyData: [HourlyForecast] = [
    HourlyForecast(hour: "Now", icon: "sun.max.fill", temperature: 72),
    HourlyForecast(hour: "1 PM", icon: "sun.max.fill", temperature: 74),
    HourlyForecast(hour: "2 PM", icon: "cloud.sun.fill", temperature: 75),
    HourlyForecast(hour: "3 PM", icon: "cloud.sun.fill", temperature: 76),
    HourlyForecast(hour: "4 PM", icon: "cloud.fill", temperature: 73),
    HourlyForecast(hour: "5 PM", icon: "cloud.fill", temperature: 70),
    HourlyForecast(hour: "6 PM", icon: "cloud.sun.fill", temperature: 68),
    HourlyForecast(hour: "7 PM", icon: "moon.stars.fill", temperature: 64),
    HourlyForecast(hour: "8 PM", icon: "moon.stars.fill", temperature: 61),
    HourlyForecast(hour: "9 PM", icon: "moon.stars.fill", temperature: 59)
]
 
