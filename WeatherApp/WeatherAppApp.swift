//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Çağan  on 9.09.2025.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject var favStore = FavouritesStore()
    var body: some Scene {
        WindowGroup {
            HomePageView()
                .environmentObject(favStore)
        }
    }
}
