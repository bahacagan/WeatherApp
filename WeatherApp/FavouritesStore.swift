//
//  FavouritesStore.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import Foundation


final class FavouritesStore: ObservableObject {
    @Published var favourites: [GeocodingResult] = []
    
    private let key = "favouriteCities"
    
    init() {
        load()
    }
    
    func add(_ city: GeocodingResult){
        favourites.append(city)
    }
    
    func remove(_ city: GeocodingResult){
        
    }
    func load(){
        guard let data = UserDefaults.standard.data(forKey: key),
              let savedCities = try? JSONDecoder().decode([GeocodingResult].self, from: data)
        else { return }
        self.favourites = savedCities
        
    }
    func save(){
        if let encodedCities = try? JSONEncoder().encode(favourites){
            UserDefaults.standard.set(encodedCities, forKey: key)
        }
    }
}
