//
//  Main.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation

struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}
extension Main {
    var tempCelsius: Int {
        Int(temp.rounded())
    }
}
extension Main {
    static func mock() -> Self {
        .init(
            temp: 288.15,
            feelsLike: 288.15,
            tempMin: 288.15,
            tempMax: 288.15,
            pressure: 1013,
            seaLevel: 1013,
            grndLevel: 1013,
            humidity: 1,
            tempKf: 1013)
    }
}
