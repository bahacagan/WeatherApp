//
//  GeocodingResponse.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import Foundation

struct GeocodingResponse: Codable {
    let results: [GeocodingResult]?
}


struct GeocodingResult: Codable, Identifiable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let country: String?
    let admin1: String?
    let timezone: String
    let population: Int?
}


