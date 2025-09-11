//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import Foundation


struct ForecastResponse: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let current_weather: CurrentWeather?
}


struct CurrentWeather: Codable {
    let temperature: Double
    let windspeed: Double
    let winddirection: Double
    let weathercode: Int
    let time: String
}
