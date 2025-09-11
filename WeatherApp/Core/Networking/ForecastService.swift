//
//  ForecastService.swift
//  WeatherApp
//
//  Created by Çağan  on 9.09.2025.
//

import Foundation



final class ForecastService {
    private let decoder: JSONDecoder
    
    init() {
        decoder = JSONDecoder()
    }
    
    func fetchForecast(lat: Double, lon: Double) async throws -> ForecastResponse {
        var components = URLComponents()
        components.scheme = API.Forecast.scheme
        components.host = API.Forecast.host
        components.path = API.Forecast.path
        components.queryItems = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
                URLQueryItem(name: "longitude", value: "\(lon)"),
                URLQueryItem(name: "current_weather", value: "true"),
                URLQueryItem(name: "timezone", value: "auto"),
                URLQueryItem(name: "daily", value: "temperature_2m_max,temperature_2m_min,weather_code,sunrise,sunset"),
                URLQueryItem(name: "past_days", value: "6"),
                URLQueryItem(name: "forecast_days", value: "1")
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                200..<300 ~= httpResponse.statusCode
        else {
            throw URLError(.badServerResponse)
        }
        
        return try decoder.decode(ForecastResponse.self, from: data)
    }
}
