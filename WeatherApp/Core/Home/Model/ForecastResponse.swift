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
    let daily: DailyWeather?
}


struct CurrentWeather: Codable {
    let temperature: Double
    let windspeed: Double
    let winddirection: Double
    let weathercode: WeatherCode
    let time: String
}


struct DailyWeather: Codable {
    let time: [String]
    let temperature_2m_max: [Double]
    let temperature_2m_min: [Double]
    let weather_code: [WeatherCode]
    let sunrise: [String]
    let sunset: [String]
}

