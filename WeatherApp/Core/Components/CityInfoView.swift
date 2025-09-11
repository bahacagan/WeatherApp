//
//  CityInfoView.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import SwiftUI

struct CityInfoView: View {
    let location: GeocodingResult
    var body: some View {
        VStack{
            HStack {
                Text(location.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                
                if let country = location.country {
                    Text(country)
                        .font(.caption)
                }
            }
            
            Text("Lat: \(String(format: "%.2f", location.latitude)),    Lon: \(String(format: "%.2f", location.longitude))")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let population = location.population {
                Text("Population: \(population)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color("PopulationColor"))
            }
                
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("CityCardColor"))
                .shadow(color: Color.white.opacity(0.5), radius: 2)
        )
        .padding(.horizontal)
        
    }
}

#Preview {
    let dummy = GeocodingResult(id: 1234, name: "Ankara", latitude: 36.88, longitude: 40.12, country: "Turkey", admin1: nil, timezone: "Europe/Istanbul", population: 3451235)
    CityInfoView(location: dummy)
}
