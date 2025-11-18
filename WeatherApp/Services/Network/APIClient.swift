//
//  APIClient.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

//api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid=API_KEY

import Foundation
import Combine

class APIClient {
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchWeather(lat: Double, lon: Double) -> AnyPublisher<WeatherResponse, Error> {
        
        let urlString = "\(EndPoints.urlString(.forecast))?lat=\(lat)&lon=\(lon)&appid=\(API_KEY)&units=metric"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let http = output.response as? HTTPURLResponse,
                      http.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)    // Update UI on main thread
            .eraseToAnyPublisher()
    }
}
