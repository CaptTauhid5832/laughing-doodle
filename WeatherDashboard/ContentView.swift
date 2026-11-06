//
//  ContentView.swift
//  WeatherDashboard
//
//  Created by Capt. Tauhid on 1/9/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(WeatherViewModel.self) private var viewModel

    private let gridColumns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]

    private let hourlyRows = [
        GridItem(.fixed(130))
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.blue.opacity(0.35),
                    Color.cyan.opacity(0.2),
                    Color.white
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    titleSection
                    headerSection
                    forecastSection
                    hourlySection
                }
                .padding()
            }
        }
    }
}

extension ContentView {
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Weather Dashboard")
                .font(.system(size: 38, weight: .black))
            Text("Weekly weather overview")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.top, 8)
    }

    private var headerSection: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(
                    colors: [
                        Color.blue.opacity(0.9),
                        Color.cyan.opacity(0.7)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                HStack {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("San Francisco")
                            .font(.system(size: geometry.size.width * 0.08, weight: .bold))
                            .foregroundStyle(.white)
                        HStack(alignment: .bottom, spacing: 10) {
                            Text("72°")
                                .font(.system(size: geometry.size.width * 0.16, weight: .heavy))
                                .foregroundStyle(.white)
                            Text("Partly Cloudy")
                                .font(.title3)
                                .foregroundStyle(.white.opacity(0.9))
                                .padding(.bottom, 10)
                        }
                        Text("H: 76°   L: 61°")
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    Spacer()
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(.yellow)
                        .shadow(color: .yellow.opacity(0.5), radius: 10)
                }
                .padding(28)
            }
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .shadow(color: .blue.opacity(0.2), radius: 12, x: 0, y: 6)
        }
        .frame(height: 220)
    }

    private var forecastSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("5-Day Forecast")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "calendar")
                    .foregroundStyle(.secondary)
            }
            LazyVGrid(columns: gridColumns, spacing: 16) {
                ForEach(forecastData) { item in
                    WeatherCard {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text(item.day)
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                                Text("\(item.temperature)°")
                                    .font(.system(size: 42, weight: .bold))
                                Text(item.condition)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(
                                        item.condition == "Rain"
                                        ? Color.blue.opacity(0.15)
                                        : Color.orange.opacity(0.15)
                                    )
                                    .frame(width: 52, height: 52)
                                Image(systemName: item.icon)
                                    .font(.title2)
                                    .foregroundStyle(
                                        item.condition == "Rain"
                                        ? .blue
                                        : .orange
                                    )
                            }
                        }
                        .frame(height: 120)
                    }
                }
            }
        }
    }

    private var hourlySection: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("Hourly Forecast")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "clock")
                    .foregroundStyle(.secondary)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: hourlyRows, spacing: 14) {
                    ForEach(hourlyData) { item in
                        WeatherCard {
                            VStack(spacing: 14) {
                                Text(item.hour)
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                                ZStack {
                                    Circle()
                                        .fill(Color.orange.opacity(0.15))
                                        .frame(width: 48, height: 48)
                                    Image(systemName: item.icon)
                                        .font(.title3)
                                        .foregroundStyle(.orange)
                                }
                                Text("\(item.temperature)°")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 110)
                        }
                        .frame(width: 92)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(WeatherViewModel())
}

