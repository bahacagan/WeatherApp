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
        
        guard !favourites.contains(where: {$0.id == city.id}) else { return }
        favourites.append(city)
        save()
    }
    
    func remove(_ city: GeocodingResult){
        favourites.removeAll { $0.id == city.id }
        save()
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
