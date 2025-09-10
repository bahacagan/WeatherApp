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
                    .foregroundColor(Color("TextColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                
                if let country = location.country {
                    Text(country)
                        .foregroundStyle(Color(#colorLiteral(red: 0.564285934, green: 0.4919891357, blue: 0.8239292502, alpha: 1)))
                        .font(.caption)
                }
            }
            
            Text("Lat: \(String(format: "%.2f", location.latitude)),    Lon: \(String(format: "%.2f", location.longitude))")
                .foregroundColor(Color("TextColor"))
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
                .fill(Color.white)
                .shadow(color: Color.purple, radius: 5)
        )
        .padding(.horizontal)
        
    }
}

#Preview {
    let dummy = GeocodingResult(id: 1234, name: "Ankara", latitude: 36.88, longitude: 40.12, country: "Turkey", admin1: nil, timezone: "Europe/Istanbul", population: 3451235)
    CityInfoView(location: dummy)
}
