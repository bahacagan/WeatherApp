//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import Foundation



class SearchViewModel: ObservableObject {
    private let geocodingService = GeocodingService()
    @Published var cityText: String = ""
    
    
    
}
