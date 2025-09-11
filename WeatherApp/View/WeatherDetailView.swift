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
    @EnvironmentObject var favStore : FavouritesStore
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

            Button {
                favStore.add(geocodingResult)
            } label: {
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                        .font(.title)
                    Text("Add to favorites")
                        .font(.title)
                        .foregroundStyle(Color("TextColor"))
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(Color.purple.opacity(0.5))
                .cornerRadius(10)
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
