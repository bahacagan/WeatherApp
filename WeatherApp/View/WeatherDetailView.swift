//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import SwiftUI

struct WeatherDetailView: View {
    let geocodingResult: GeocodingResult
    @StateObject private var forecastViewModel = ForecastViewModel()
    var body: some View {
        VStack(spacing: 16) {
            // Şehir adı başlık
            Text(geocodingResult.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            // Eğer mevcut hava durumu varsa
            if let cw = forecastViewModel.currentWeather {
                Text("\(Int(cw.temperature))°")
                    .font(.system(size: 60))
                    .fontWeight(.semibold)

                HStack {
                    Text("Wind: \(Int(cw.windspeed)) km/h")
                    Spacer()
                    Text("Dir: \(Int(cw.winddirection))°")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Text("Updated at \(cw.time)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            } else if let error = forecastViewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            } else {
                ProgressView("Loading...")
            }

            Spacer()
        }
        .padding()
        .task {
            await forecastViewModel.loadCurrentWeather(lat: geocodingResult.latitude, lon: geocodingResult.longitude)
        }
    }
}

#Preview {
    let dummy = GeocodingResult(id: 1234, name: "Ankara", latitude: 36.88, longitude: 40.12, country: "Turkey", admin1: nil, timezone: "Europe/Istanbul", population: 3451235)
    WeatherDetailView(geocodingResult: dummy)
}
