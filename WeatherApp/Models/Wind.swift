//
//  Wind.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
extension Wind {
    static func mock() -> Self {
        .init(speed: 10.0, deg: 180, gust: 15.0)
    }
}
