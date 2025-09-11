//
//  ForeCastViewModel.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import Foundation
import Combine

@MainActor
class ForecastViewModel: ObservableObject {
    private let forecastService = ForecastService()
    @Published var currentWeather: CurrentWeather?
    @Published var dailyWeather: DailyWeather?
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    func loadCurrentWeather(lat: Double, lon: Double) async{
        
        guard (-90...90).contains(lat), (-180...180).contains(lon) else {
                    self.currentWeather = nil
                    self.errorMessage = "Invalid coordinates"
                    return
        }
        
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let response = try await forecastService.fetchForecast(lat: lat, lon: lon)
            self.currentWeather = response.current_weather
            self.dailyWeather = response.daily
        } catch  {
            self.currentWeather = nil
            self.errorMessage = "Forecast could not be loaded"
        }
    }
    
    
    private func formatDate(from daily: DailyWeather) -> [Date] {
        let dayFormatter = DateFormatter()
               dayFormatter.dateFormat = "yyyy-MM-dd"
               dayFormatter.locale = Locale(identifier: "en_US_POSIX")
               dayFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let parsedDates: [Date] = daily.time.compactMap { dayFormatter.date(from: $0) }
        return parsedDates
    }
}
