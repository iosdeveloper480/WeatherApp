//
//  ContentView.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.response!.list as! Decoder) { item in
                
            }
        }.onAppear() {
            viewModel.load(lat: 25.308, lon: 55.377)
        }
    }
}

#Preview {
    ContentView()
}

//NavigationView {
//    List {
//        ForEach(1...5, id: \.self) { i in
//            WeatherCell()
//                .listRowSeparator(.hidden)
//                .listRowBackground(Color.clear)
//        }
//    }
//    .scrollContentBackground(.hidden)
//    .background(
//        Image("Cloudy")
//            .resizable()
//            .scaledToFill()
//            .ignoresSafeArea()
//    )
//    .listStyle(.plain)
//    .navigationTitle("My Static Cells")
//    .navigationBarTitleDisplayMode(.inline)
//}
