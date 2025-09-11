//
//  HomePageView.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var searchViewModel = SearchViewModel()
    @EnvironmentObject var favStore : FavouritesStore
    @State private var showErrorAlert = false
    var body: some View {
        NavigationStack {
            ZStack {
                //background
                Color("BackgroundColor").ignoresSafeArea(edges: .all)
                
                VStack {
                    TextField("Enter the city", text: $searchViewModel.cityText)
                        .padding()
                        .frame(height: 50)
                        .font(.title)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                        .padding()
                    
                    //Search Button
                    Button {
                        Task {
                            await searchViewModel.search()
                            if searchViewModel.errorMessage != nil {
                                showErrorAlert = true
                            }
                        }
                    } label: {
                        Text("Search")
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .font(.title)
                            .background(Color("SearchButtonColor"))
                            .cornerRadius(10)
                            .padding(.horizontal,10)
                    }
                    
                    // Search results are listed here
                    ScrollView{
                        LazyVStack(spacing: 10) {
                            ForEach(searchViewModel.cityResults) {city in
                                
                                NavigationLink(destination:
                                        WeatherDetailView(geocodingResult: city)
                                ) {
                                    CityInfoView(location: city)
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    .padding(.top, 10)
                    
                }
            }
            .navigationTitle("Weather")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: FavouritesView()) {
                        Image(systemName: "star")
                            .font(.title)
                            .foregroundStyle(Color("StarColor"))
                    }
                }
            }
        }
        .alert("Error", isPresented: $showErrorAlert) {
                        Button("OK", role: .cancel) {
                            searchViewModel.errorMessage = nil
                        }
                    } message: {
                        Text(searchViewModel.errorMessage ?? "")
                    }
    }
}

#Preview {
    HomePageView()
        .environmentObject(FavouritesStore())
}
