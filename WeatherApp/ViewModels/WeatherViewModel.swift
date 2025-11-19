//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation
import Combine

@MainActor
class WeatherViewModel: ObservableObject {

    @Published var background = "Forest"
    @Published var response: [WeatherList]?
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let apiClient = APIClient()

    func load(lat: Double, lon: Double) {
        apiClient.fetchWeather(lat: lat, lon: lon)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { weather in
                let skimmedList = weather.list.filter { !$0.date.isInToday }
                self.response = self.highTempPerDay(from: skimmedList)
                let today = self.highTempPerDay(from: weather.list.filter { $0.date.isInToday })
                if let first = today.first {
                    self.background = first.weather.first!.main
                }
            }
            .store(in: &cancellables)
    }
    
    func highTempPerDay(from list: [WeatherList]) -> [WeatherList] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let grouped = Dictionary(grouping: list) { item -> String in
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: item.date)
        }
        
        let result = grouped.map { (_, items) -> WeatherList in
            items.max(by: { $0.main.temp < $1.main.temp })!
        }
        
        return result.sorted { $0.dt < $1.dt }
    }
}
