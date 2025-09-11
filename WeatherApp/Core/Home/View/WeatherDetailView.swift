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
        ZStack {
            //background
            Color("BackgroundColor").ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text(geocodingResult.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let cw = forecastViewModel.currentWeather {
                    HStack(spacing: 16) {
                        Image(systemName: cw.weathercode.sfSymbolName(isDay: true))
                            .font(.system(size: 60))
                            .fontWeight(.semibold)
                        
                        Text("\(Int(cw.temperature))°")
                            .font(.system(size: 60))
                            .fontWeight(.semibold)
                    }
                    
                    Text(cw.weathercode.description)
                        .font(.title)
                    
                    HStack {
                        Text("Wind: \(Int(cw.windspeed)) km/h")
                            .font(.headline)
                        Spacer()
                        Text("Dir: \(Int(cw.winddirection))°")
                            .font(.headline)
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
                        Image(systemName: "star")
                            .foregroundStyle(.yellow)
                            .font(.title)
                        Text("Add to favorites")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color("SearchButtonColor"))
                    .cornerRadius(10)
                }
                
                // Chart
                
                
                Spacer()
            }
            .padding()
            .task {
                await forecastViewModel.loadCurrentWeather(lat: geocodingResult.latitude, lon: geocodingResult.longitude)
            }
        }
    }
}

#Preview {
    let dummy = GeocodingResult(id: 1234, name: "Ankara", latitude: 36.88, longitude: 40.12, country: "Turkey", admin1: nil, timezone: "Europe/Istanbul", population: 3451235)
    WeatherDetailView(geocodingResult: dummy)
        .environmentObject(FavouritesStore())
}
