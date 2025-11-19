//
//  ContentView.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import SwiftUI
import Combine
import CoreLocation

struct ContentView: View {
    
    @StateObject private var locationManager = LocationService()
    @StateObject private var weatherVM = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if let weather = weatherVM.response {
                    List(weather) { item in
                        WeatherCell(weatherListModel: item)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                    .background(
                        Image(weatherVM.background)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    )
                    .listStyle(.plain)
                    .navigationTitle("5 Days Forecast")
                    .navigationBarTitleDisplayMode(.large)
                    
                } else if locationManager.permissionDenied {
                    
                    VStack(spacing: 10) {
                        Text("Location Access Required")
                            .font(.headline)
                        Button("Enable Location") {
                            locationManager.requestLocation()
                        }
                    }
                    
                } else {
                    ProgressView("Fetching weather…")
                }
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
        .onReceive(locationManager.$currentLocation) { loc in
            if let loc = loc {
                weatherVM.load(
                    lat: loc.coordinate.latitude,
                    lon: loc.coordinate.longitude
                )
            }
        }
    }
    
    //    var body: some View {
    //        VStack {
    //            if let loc = locationService.currentLocation {
    //                if let weather = weatherVM.response {
    //                    NavigationView {
    //                        List(weather.list) { item in
    //                            Text(item.)
    //                        }
    //                    }.onAppear() {
    //                        viewModel.load(lat: 25.308, lon: 55.377)
    //                    }
    //                } else {
    //                    ProgressView("Loading weather…")
    //                }
    //
    //            } else if locationService.permissionDenied {
    //                Text("Location permission denied")
    //                    .foregroundColor(.red)
    //            } else {
    //                VStack(spacing: 10) {
    //                    Text("We need your location for weather")
    //                    Button("Allow Location") {
    //                        locationService.requestLocation()
    //                    }
    //                }
    //            }
    //        }
    //        .onReceive(locationService.$currentLocation) { loc in
    //            if let loc = loc {
    //                weatherVM.load(lat: loc.coordinate.latitude,
    //                               lon: loc.coordinate.longitude)
    //            }
    //        }
    //    }
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
