//
//  WeatherViewModel.swift
//  WeatherDashboard
//
//  Created by Capt. Tauhid on 4/9/26.
//

import Foundation
import Observation

@Observable
class WeatherViewModel {

    // City & Current Conditions

    var city: String = "San Francisco"
    var currentTemperature: Int = 72
    var currentCondition: String = "Partly Cloudy"
    var high: Int = 76
    var low: Int = 61

    // Search

    var searchText: String = ""

    // Forecast Data

    var forecastData: [Forecast] = []
    var hourlyData: [HourlyForecast] = []

    // Computed: Filtered Forecasts

    var filteredForecasts: [Forecast] {
        if searchText.isEmpty {
            return forecastData
        }
        return forecastData.filter { forecast in
            forecast.condition.localizedCaseInsensitiveContains(searchText) ||
            forecast.day.localizedCaseInsensitiveContains(searchText)
        }
    }

    // Load Sample Data

    func loadWeather() {
        forecastData = [
            Forecast(day: "Mon", icon: "sun.max.fill",    temperature: 68, condition: "Sunny"),
            Forecast(day: "Tue", icon: "cloud.fill",      temperature: 72, condition: "Cloudy"),
            Forecast(day: "Wed", icon: "cloud.rain.fill", temperature: 65, condition: "Rain"),
            Forecast(day: "Thu", icon: "sun.max.fill",    temperature: 70, condition: "Clear"),
            Forecast(day: "Fri", icon: "sun.max.fill",    temperature: 74, condition: "Sunny")
        ]

        hourlyData = [
            HourlyForecast(hour: "Now", icon: "sun.max.fill",  temperature: 72),
            HourlyForecast(hour: "1PM", icon: "sun.max.fill",  temperature: 73),
            HourlyForecast(hour: "2PM", icon: "sun.max.fill",  temperature: 74),
            HourlyForecast(hour: "3PM", icon: "sun.max.fill",  temperature: 73),
            HourlyForecast(hour: "4PM", icon: "sun.max.fill",  temperature: 71),
            HourlyForecast(hour: "5PM", icon: "sunset.fill",   temperature: 70)
        ]
    }
}
