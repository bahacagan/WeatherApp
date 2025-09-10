//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import Foundation


struct ForecastResponse: Decodable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let current_weather: CurrentWeather?
    let hourly: HourlyForecast?
    let daily: DailyForecast?
}


struct CurrentWeather: Decodable {
    let temperature: Double
    let windspeed: Double
    let winddirection: Double
    let weathercode: Int
    let time: String
}

struct HourlyForecast: Decodable {
    let time: [String]
    let temperature_2m: [Double]?
}

struct DailyForecast: Decodable {
    let time: [String]
    let temperature_2m_max: [Double]?
    let temperature_2m_min: [Double]?
}

