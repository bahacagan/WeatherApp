//
//  Endpoints.swift
//  WeatherApp
//
//  Created by Çağan  on 9.09.2025.
//

import Foundation


struct API {
    struct Geocoding {
        static let scheme = "https"
        static let host = "geocoding-api.open-meteo.com"
        static let path = "/v1/search"
    }

    struct Forecast {
        static let scheme = "https"
        static let host = "https://api.open-meteo.com"
        static let path = "/v1/forecast"
    }
}
