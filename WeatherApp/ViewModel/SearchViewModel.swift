//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import Foundation


@MainActor
class SearchViewModel: ObservableObject {
    private let geocodingService = GeocodingService()
    @Published var cityText: String = ""
    @Published var cityResult: GeocodingResult? = nil
    @Published var errorMessage: String? = nil
    
    func search() async {
        // If input is empty early return
        if cityText.isEmpty {
            return
        }
        
        do {
            let response = try await geocodingService.fetchCoordinates(for: cityText)
            
            if let result = response.results?.first {
                cityResult = result
            } else {
                cityResult = nil
                errorMessage = "City not found"
            }
            
        } catch  {
            cityResult = nil
            errorMessage = "Something went wrong"
        }
        
    }
    
}
