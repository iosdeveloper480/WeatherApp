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

    @Published var response: WeatherResponse?
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
                self.response = weather
            }
            .store(in: &cancellables)
    }
}
