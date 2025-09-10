//
//  GeocodingService.swift
//  WeatherApp
//
//  Created by Çağan  on 9.09.2025.
//

import Foundation


final class GeocodingService {
    private let decoder: JSONDecoder
    init() {
        decoder = JSONDecoder()
    }
    
    func fetchCoordinates(for city: String) async throws -> GeocodingResponse {
        var components = URLComponents()
        components.scheme = API.Geocoding.scheme
        components.host = API.Geocoding.host
        components.path = API.Geocoding.path
        components.queryItems = [
            URLQueryItem(name: "name", value: city),
            URLQueryItem(name: "count", value: "1"),
            URLQueryItem(name: "language", value: "tr")
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                200..<300 ~= httpResponse.statusCode
        else {
            throw URLError(.badServerResponse)
        }
        
        return try decoder.decode(GeocodingResponse.self, from: data)
        
    }
}
