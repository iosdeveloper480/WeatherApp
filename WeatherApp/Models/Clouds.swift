//
//  Clouds.swift
//  WeatherApp
//
//  Created by Waqas Ali on 11/18/25.
//

import Foundation

struct Clouds: Codable {
    let all: Int
}
extension Clouds {
    static func mock() -> Self {
        .init(all: 100)
    }
}
