//
//  WeatherCard.swift
//  WeatherDashboard
//
//  Created by Capt. Tauhid on 1/9/26.
//

import SwiftUI

struct WeatherCard<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardStyle()
    }
}
