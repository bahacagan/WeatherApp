//
//  FavouritesView.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favStore: FavouritesStore
    
    var body: some View {
        ZStack {
            //background
            Color("BackgroundColor").ignoresSafeArea(edges: .all)
            
            VStack(spacing: 20) {
                Text("Favourite Cities")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(favStore.favourites) { city in
                            
                            HStack {
                                NavigationLink(
                                    destination: WeatherDetailView(geocodingResult: city)
                                ) {
                                    CityInfoView(location: city)
                                }
                                Button {
                                    withAnimation(.easeOut) {
                                        favStore.remove(city)
                                    }
                                    
                                } label: {
                                    Image(systemName: "xmark.circle")
                                        .font(.title)
                                        .foregroundColor(.red)
                                }

                            }
                        }
                    }
                    .padding(.vertical, 5)
                }
                
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    FavouritesView()
        .environmentObject(FavouritesStore())
}
