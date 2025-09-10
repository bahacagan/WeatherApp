//
//  HomePageView.swift
//  WeatherApp
//
//  Created by Çağan  on 10.09.2025.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var searchViewModel = SearchViewModel()
    @State var text: String = ""
    var body: some View {
        ZStack {
            //background
            Color("BackgroundColor").ignoresSafeArea(edges: .all)
            
            VStack {
                TextField("Enter the city", text: $text)
                    .padding()
                    .frame(height: 50)
                    .font(.title)
                    .background(Color("SearchColor").opacity(0.8))
                    .cornerRadius(10)
                    .padding()
                
                Button {
                    Task {
                        
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

                    
                Spacer()
            }
        }
    }
}

#Preview {
    HomePageView()
}
