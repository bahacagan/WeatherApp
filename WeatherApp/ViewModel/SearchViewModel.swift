//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import Foundation
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    private let geocodingService = GeocodingService()
    @Published var cityText: String = ""
    @Published var cityResults: [GeocodingResult] = []
    @Published var errorMessage: String? = nil
    
    func search() async {
        // If input is empty early return
        if cityText.isEmpty {
            return
        }
        
        // clean the past search results
        cityResults = []
        errorMessage = nil
        
        do {
            let response = try await geocodingService.fetchCoordinates(for: cityText)

            let results = response.results ?? []
            cityResults = results
            errorMessage = results.isEmpty ? "Şehir bulunamadı" : nil
            
        } catch  {
            cityResults = []
            errorMessage = "Something went wrong"
        }
        
    }
    
}
